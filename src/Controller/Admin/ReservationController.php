<?php

namespace App\Controller\Admin;

use App\Entity\Admin\Reservation;
use App\Form\Admin\ReservationType;
use App\Repository\Admin\ReservationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/reservation')]
class ReservationController extends AbstractController
{
    #[Route('/{slug}', name: 'admin_reservation_index', methods: ['GET'])]
    public function indexNewReservations($slug, ReservationRepository $reservationRepository): Response
    {
        //$reservations=$reservationRepository->getReservations();
        $reservations=$reservationRepository->getReservations($slug);
        return $this->render('admin/reservation/index.html.twig', [
            'reservations' => $reservations,
        ]);
    }
    #[Route('/', name: 'admin_Allreservation_index', methods: ['GET'])]
    public function index(ReservationRepository $reservationRepository): Response
    {
        //$reservations=$reservationRepository->getReservations();
        // $reservations=$reservationRepository->getReservations($slug);
        $reservations=$reservationRepository->getAllReservations();
        return $this->render('admin/reservation/index.html.twig', [
            'reservations' => $reservations,
        ]);
    }

    // #[Route('/new', name: 'admin_reservation_new', methods: ['GET', 'POST'])]
    // public function new(Request $request, ReservationRepository $reservationRepository): Response
    // {
    //     $reservation = new Reservation();
    //     $form = $this->createForm(ReservationType::class, $reservation);
    //     $form->handleRequest($request);

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $reservationRepository->add($reservation, true);

    //         return $this->redirectToRoute('admin_reservation_index');
    //     }

    //     return $this->renderForm('admin/reservation/new.html.twig', [
    //         'reservation' => $reservation,
    //         'form' => $form,
    //     ]);
    // }

    #[Route('/show/{id}', name: 'admin_reservation_show', methods: ['GET'])]
    public function show($id, ReservationRepository  $reservationRepository): Response
    {
        $reservation = $reservationRepository->getReservation($id);

        return $this->render('admin/reservation/show.html.twig', [
            'reservation' => $reservation,
        ]);
    }

    #[Route('/{id}/edit', name: 'admin_reservation_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Reservation $reservation, ReservationRepository $reservationRepository): Response
    {
        $form = $this->createForm(ReservationType::class, $reservation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $status = $form['status']->getData();
            $reservationRepository->add($reservation, true);

            return $this->redirectToRoute('admin_reservation_index', ['slug'=>$status]);
        }

        return $this->renderForm('admin/reservation/edit.html.twig', [
            'reservation' => $reservation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'admin_reservation_delete', methods: ['POST'])]
    public function delete(Request $request, Reservation $reservation, ReservationRepository $reservationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$reservation->getId(), $request->request->get('_token'))) {
            // $slug = $form['status']->getData();
            $reservationRepository->remove($reservation, true);
        }

        return $this->redirectToRoute('admin_Allreservation_index');
    }
}
