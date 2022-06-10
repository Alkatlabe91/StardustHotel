<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Entity\Admin\Reservation;
use App\Form\RegistrationFormType;
use App\Repository\UserRepository;
use App\Form\Admin\ReservationType;
use App\Repository\Admin\RoomRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\Admin\ReservationRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;


/**
 * @Route("/user")
 */
class UserController extends AbstractController
{
    /**
     * @Route("/", name="app_user_index", methods={"GET"})
     */
    public function index(): Response
    {
        return $this->render('user/show.html.twig');
    }

     /**
     * @Route("/reservations", name="user_reservations", methods={"GET"})
     */
    public function reservations(ReservationRepository $reservationRepository): Response
    {
        $user = $this->getUser(); // Get login User data
       //$reservations = $reservationRepository->findBy(['userid'=>$user->getId()]);
        $reservations = $reservationRepository->getUserReservation($user->getId());
    //    dump($reservations);
    //    die();
        return $this->render('user/reservations.html.twig', [
            'reservations' =>$reservations,
        ]);
    }

    #[Route('/reservation/{rid}', name: 'app_user_reservation_new', methods: ['GET', 'POST'])]
    public function newReservation(Request $request, $rid,ReservationRepository $reservationRepository, RoomRepository $roomRepository): Response
    {
        $room=$roomRepository->findOneBy(['id'=>$rid]);
      
        $days=$_REQUEST["days"];
        $checkin=$_REQUEST["checkin"];
        $checkout= Date("Y-m-d H:i:s", strtotime($checkin ." $days Day")); // Adding days to date
        $checkin= Date("Y-m-d H:i:s", strtotime($checkin ." 0 Day"));

        $data["total"]=$days * $room->getPrice();
        $data["days"]=$days;
        $data["checkin"]=$checkin;
        $data["checkout"]=$checkout;
      //  print_r($data);

       // die();

        $reservation = new Reservation();
        $form = $this->createForm(ReservationType::class, $reservation);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');
        if ($form->isSubmitted()) {
            if ($this->isCsrfTokenValid('form-reservation', $submittedToken)) {
              //                dump($data);
//                die();
                 $checkin=date_create_from_format("Y-m-d H:i:s",$checkin); //Convert to datetime format
                 $checkout=date_create_from_format("Y-m-d H:i:s",$checkout); //Convert to datetime format
//                dump($data);
//                die();
                $reservation->setCheckin($checkin);
                $reservation->setCheckout($checkout);
                $reservation->setStatus('New');

                $reservation->setRoomid($rid);
                $user = $this->getUser(); // Get login User data
                $reservation->setUserid($user->getId());
                $reservation->setDays($days);
                $reservation->setTotal($data["total"]);
                $reservation->setCreatedAt(new \DateTime()); // Get now datatime
            $reservationRepository->add($reservation, true);

            return $this->redirectToRoute('user_reservations');
            }
        }

        return $this->renderForm('user/newreservation.html.twig', [
            'reservation' => $reservation,
            'form' => $form,
            'room' => $room,
            'data' => $data,
            
        ]);
    }


    // #[Route('/new', name: 'app_user_new', methods: ['GET', 'POST'])]
    // public function new(Request $request, UserRepository $userRepository, UserPasswordHasherInterface $userPasswordHasher): Response
    // {
    //     $user = new User();
    //     $form = $this->createForm(UserType::class, $user);
    //     $form->handleRequest($request);

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         //************** file upload ***>>>>>>>>>>>>
    //         /** @var file $file */
    //         $file = $form['image']->getData();
    //         if ($file) {
    //             $fileName = $this->generateUniqueFileName() . '.' . $file->guessExtension();
    //             // Move the file to the directory where brochures are stored
    //             try {
    //                 $file->move(
    //                     $this->getParameter('images_directory'), // in Servis.yaml defined folder for upload images
    //                     $fileName
    //                 );
    //             } catch (FileException $e) {
    //                 // ... handle exception if something happens during file upload
    //             }

    //             $user->setImage($fileName); // Related upload file name with Hotel table image field
    //         }
    //         //<<<<<<<<<<<<<<<<<******** file upload ***********>

    //           // encode the plain password
    //           $user->setPassword(
    //             $userPasswordHasher->hashPassword(
    //                     $user,
    //                     $form->get('password')->getData()
    //                 )
    //             );


    //         $userRepository->add($user, true);

    //         return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
    //     }

    //     return $this->renderForm('user/new.html.twig', [
    //         'user' => $user,
    //         'form' => $form,
    //     ]);
    // }

    #[Route('/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show(User $user): Response
    {
        return $this->render('user/show.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, $id, User $user, UserRepository $userRepository, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        $user = $this->getUser(); // Get login User data
        if ($user->getId() != $id)
        {
            return $this->redirectToRoute('home');
        }
            
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            //************** file upload ***>>>>>>>>>>>>
            /** @var file $file */
            $file = $form['image']->getData();
            if ($file) {
                $fileName = $this->generateUniqueFileName() . '.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('images_directory'), // in Servis.yaml defined folder for upload images
                        $fileName
                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                $user->setImage($fileName); // Related upload file name with Hotel table image field
            }
            //<<<<<<<<<<<<<<<<<******** file upload ***********>

                 // encode the plain password
                 $user->setPassword(
                    $userPasswordHasher->hashPassword(
                            $user,
                            $form->get('password')->getData()
                        )
                    );
                   

            $userRepository->add($user, true);

            return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('user/edit.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }

       /**
     * @return string
     */
    private function generateUniqueFileName()
    {
        // md5() reduces the similarity of the file names generated by
        // uniqid(), which is based on timestamps
        return md5(uniqid());
    }



    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(Request $request, User $user, UserRepository $userRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {
            $userRepository->remove($user, true);
        }

        return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
    }
}
