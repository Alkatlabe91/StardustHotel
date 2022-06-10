<?php

namespace App\Controller;

use App\Repository\Admin\RoomRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/home', name: 'home')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig');
    }

 /**
 * @Route("/room", name="room_show", methods={"GET"})
 */
public function show(RoomRepository $roomRepository): Response
{
   
    $rooms =$roomRepository->findAll();
    return $this->render('home/roomshow.html.twig', [
        'rooms' => $rooms,
   
    ]);
}
      
 /**
     * @Route("/contact", name="home_contact", methods={"GET","POST"})
     */
    public function contact(): Response
    {
        

        return $this->render('home/contact.html.twig');
    }

}
