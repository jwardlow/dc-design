FasdUAS 1.101.10   ��   ��    k             l     ��  ��    I C Ask what type of context we're implementing, set the answer as "c"     � 	 	 �   A s k   w h a t   t y p e   o f   c o n t e x t   w e ' r e   i m p l e m e n t i n g ,   s e t   t h e   a n s w e r   a s   " c "   
  
 l     ����  r         l     ����  I    ��  
�� .gtqpchltns    @   @ ns    J            m        �    S i t e      m       �    J o u r n a l   ��  m       �   
 E v e n t��    ��  
�� 
prmp  m         � ! ! * W h a t   t y p e   o f   c o n t e x t ?  �� "��
�� 
inSL " m    	 # # � $ $  S i t e��  ��  ��    o      ���� 0 c  ��  ��     % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) "  Make the cancel button work    * � + + 8   M a k e   t h e   c a n c e l   b u t t o n   w o r k (  , - , l   $ .���� . Z    $ / 0�� 1 / =     2 3 2 o    ���� 0 c   3 m    ��
�� boovfals 0 R    ���� 4
�� .ascrerr ****      � ****��   4 �� 5��
�� 
errn 5 m    ��������  ��   1 r    $ 6 7 6 c    " 8 9 8 o     ���� 0 c   9 m     !��
�� 
TEXT 7 o      ���� 0 c  ��  ��   -  : ; : l     ��������  ��  ��   ;  < = < l     �� > ?��   > ~ x Ask for shortname/URL label, which will become the project folder's name and allow us to upload assets to the demo site    ? � @ @ �   A s k   f o r   s h o r t n a m e / U R L   l a b e l ,   w h i c h   w i l l   b e c o m e   t h e   p r o j e c t   f o l d e r ' s   n a m e   a n d   a l l o w   u s   t o   u p l o a d   a s s e t s   t o   t h e   d e m o   s i t e =  A B A l  % 6 C���� C r   % 6 D E D c   % 2 F G F n   % 0 H I H 1   , 0��
�� 
ttxt I l  % , J���� J I  % ,�� K L
�� .sysodlogaskr        TEXT K m   % & M M � N N j P l e a s e   e n t e r   t h e   I R   s h o r t n a m e   o r   s t r u c t u r e   u r l   l a b e l : L �� O��
�� 
dtxt O m   ' ( P P � Q Q  ��  ��  ��   G m   0 1��
�� 
TEXT E o      ���� 0 	shortname  ��  ��   B  R S R l     ��������  ��  ��   S  T U T l  7 b V���� V r   7 b W X W n   7 ^ Y Z Y 1   Z ^��
�� 
bhit Z l  7 Z [���� [ I  7 Z�� \ ]
�� .sysodlogaskr        TEXT \ m   7 : ^ ^ � _ _ 4 W h a t   w o u l d   y o u   l i k e   t o   d o ? ] �� ` a
�� 
btns ` J   = H b b  c d c m   = @ e e � f f  M a k e   n e w   f o l d e r d  g h g m   @ C i i � j j  U p l o a d   a s s e t s h  k�� k m   C F l l � m m  C a n c e l��   a �� n o
�� 
dflt n m   K N p p � q q  M a k e   n e w   f o l d e r o �� r��
�� 
cbtn r m   Q T s s � t t  C a n c e l��  ��  ��   X o      ���� 0 task  ��  ��   U  u v u l     ��������  ��  ��   v  w x w l     �� y z��   y . ( Begin code to create new project folder    z � { { P   B e g i n   c o d e   t o   c r e a t e   n e w   p r o j e c t   f o l d e r x  | } | l  c� ~���� ~ Z   c�  �����  =   c j � � � o   c f���� 0 task   � m   f i � � � � �  M a k e   n e w   f o l d e r � k   m� � �  � � � l  m m�� � ���   � W Q Specify header-only designs so we can copy a different set of templates for them    � � � � �   S p e c i f y   h e a d e r - o n l y   d e s i g n s   s o   w e   c a n   c o p y   a   d i f f e r e n t   s e t   o f   t e m p l a t e s   f o r   t h e m �  � � � Z   m � � ����� � >   m r � � � o   m n���� 0 c   � m   n q � � � � �  S i t e � r   u � � � � c   u � � � � n   u � � � � 1   � ���
�� 
bhit � l  u � ����� � I  u ��� � �
�� .sysodlogaskr        TEXT � m   u x � � � � �  H e a d e r - o n l y ? � �� ���
�� 
btns � J   { � � �  � � � m   { ~ � � � � �  Y e s �  ��� � m   ~ � � � � � �  N o��  ��  ��  ��   � m   � ���
�� 
TEXT � o      ���� 0 
headeronly 
headerOnly��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � � � Set up a path in the appropriate context type's folder where we'll create the new project folder - customize this for whatever folder structure you use to hold project files    � � � �\   S e t   u p   a   p a t h   i n   t h e   a p p r o p r i a t e   c o n t e x t   t y p e ' s   f o l d e r   w h e r e   w e ' l l   c r e a t e   t h e   n e w   p r o j e c t   f o l d e r   -   c u s t o m i z e   t h i s   f o r   w h a t e v e r   f o l d e r   s t r u c t u r e   y o u   u s e   t o   h o l d   p r o j e c t   f i l e s �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � N / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / � o   � ����� 0 c   � m   � � � � � � �  s / � o   � ����� 0 c   � m   � � � � � � �  - d e s i g n s / � o   � ����� 0 	shortname   � o      ���� 0 pfolder   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � � � Set up a path to the "templates" folder for the appropriate context type. Everything in the templates folder will be copied into the new project folder, customize as desired    � � � �\   S e t   u p   a   p a t h   t o   t h e   " t e m p l a t e s "   f o l d e r   f o r   t h e   a p p r o p r i a t e   c o n t e x t   t y p e .   E v e r y t h i n g   i n   t h e   t e m p l a t e s   f o l d e r   w i l l   b e   c o p i e d   i n t o   t h e   n e w   p r o j e c t   f o l d e r ,   c u s t o m i z e   a s   d e s i r e d �  � � � Z   � � ��� � � F   � � � � � >   � � � � � o   � ����� 0 c   � m   � � � � � � �  S i t e � =   � � � � � o   � ����� 0 
headeronly 
headerOnly � m   � � � � � � �  Y e s � k   � � � �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � N / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / � o   � ����� 0 c   � m   � � � � � � �  s / � o   � ����� 0 c   � m   � � � � � � � . - t e m p l a t e s - h e a d e r - o n l y / � o      ���� 0 tfolder   �  ��� � r   � � � � � c   � � � � � n   � � � � � 1   � ���
�� 
ttxt � l  � � ����� � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � H P l e a s e   e n t e r   t h e   I R - l e v e l   s h o r t n a m e : � �� ���
�� 
dtxt � m   � � � � � � �  ��  ��  ��   � m   � ���
�� 
TEXT � o      ���� 0 irshortname irShortname��  ��   � r   � � � � b   � � � � � b   � � � � � b   � �   b   � � m   � � � N / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / o   � ����� 0 c   m   � � �  s / � o   � ����� 0 c   � m   � � �		  - t e m p l a t e s / � o      ���� 0 tfolder   � 

 l ��������  ��  ��    l ����   � | This variable will be used for renaming in case there's already a folder with the name we want to use, customize as desired    � �   T h i s   v a r i a b l e   w i l l   b e   u s e d   f o r   r e n a m i n g   i n   c a s e   t h e r e ' s   a l r e a d y   a   f o l d e r   w i t h   t h e   n a m e   w e   w a n t   t o   u s e ,   c u s t o m i z e   a s   d e s i r e d  r   b   o  ���� 0 pfolder   m  
 �  - o g o      ���� 0 rfolder    l ��������  ��  ��    l ����   k e This variable is a shortcut for copying everything in the templates folder to the new project folder    � �   T h i s   v a r i a b l e   i s   a   s h o r t c u t   f o r   c o p y i n g   e v e r y t h i n g   i n   t h e   t e m p l a t e s   f o l d e r   t o   t h e   n e w   p r o j e c t   f o l d e r  !  r  #"#" b  $%$ b  &'& b  ()( m  ** �++  c p   - R  ) o  ���� 0 tfolder  ' m  ,, �--   % o  ���� 0 pfolder  # o      ���� 0 cpcmd cpCmd! ./. l $$��������  ��  ��  / 010 l $$��23��  2 � �Try making the new project folder. If it already exists, rename the original one, then create the new one. Copy everything in the templates folder to the new project folder.   3 �44Z T r y   m a k i n g   t h e   n e w   p r o j e c t   f o l d e r .   I f   i t   a l r e a d y   e x i s t s ,   r e n a m e   t h e   o r i g i n a l   o n e ,   t h e n   c r e a t e   t h e   n e w   o n e .   C o p y   e v e r y t h i n g   i n   t h e   t e m p l a t e s   f o l d e r   t o   t h e   n e w   p r o j e c t   f o l d e r .1 565 Q  $]7897 k  '::: ;<; I '2��=�
�� .sysoexecTEXT���     TEXT= b  '.>?> m  '*@@ �AA  m k d i r  ? o  *-�~�~ 0 pfolder  �  < B�}B I 3:�|C�{
�| .sysoexecTEXT���     TEXTC o  36�z�z 0 cpcmd cpCmd�{  �}  8 R      �y�x�w
�y .ascrerr ****      � ****�x  �w  9 k  B]DD EFE I BU�vG�u
�v .sysoexecTEXT���     TEXTG b  BQHIH b  BMJKJ b  BILML m  BENN �OO  m v  M o  EH�t�t 0 pfolder  K m  ILPP �QQ   I o  MP�s�s 0 rfolder  �u  F R�rR I V]�qS�p
�q .sysoexecTEXT���     TEXTS o  VY�o�o 0 cpcmd cpCmd�p  �r  6 TUT l ^^�n�m�l�n  �m  �l  U VWV l ^^�kXY�k  X K E Find & replace LOCALID with the shortname in newly-created templates   Y �ZZ �   F i n d   &   r e p l a c e   L O C A L I D   w i t h   t h e   s h o r t n a m e   i n   n e w l y - c r e a t e d   t e m p l a t e sW [\[ I ^u�j]�i
�j .sysoexecTEXT���     TEXT] b  ^q^_^ b  ^m`a` b  ^ibcb b  ^eded m  ^aff �gg 
 f i n d  e o  ad�h�h 0 pfolder  c m  ehhh �ii b   - t y p e   f   - p r i n t 0   |   x a r g s   - 0   s e d   - i   ' '   ' s / L O C A L I D /a o  il�g�g 0 	shortname  _ m  mpjj �kk  / g '�i  \ lml l vv�fno�f  n I C For header-only designs, add find & replace for header_inherit.inc   o �pp �   F o r   h e a d e r - o n l y   d e s i g n s ,   a d d   f i n d   &   r e p l a c e   f o r   h e a d e r _ i n h e r i t . i n cm qrq Z  v�st�e�ds F  v�uvu >  v{wxw o  vw�c�c 0 c  x m  wzyy �zz  S i t ev =  ~�{|{ o  ~��b�b 0 
headeronly 
headerOnly| m  ��}} �~~  Y e st I ���a�`
�a .sysoexecTEXT���     TEXT b  ����� b  ����� b  ����� b  ����� m  ���� ��� 2 s e d   - i   ' '   ' s / i r S h o r t n a m e /� o  ���_�_ 0 irshortname irShortname� m  ���� ���  / g '  � o  ���^�^ 0 pfolder  � m  ���� ��� 4 / A s s e t s / h e a d e r _ i n h e r i t . i n c�`  �e  �d  r ��� l ���]�\�[�]  �\  �[  � ��� l ���Z���Z  � L F Open up the new project folder, setup doc, & ir-local for convenience   � ��� �   O p e n   u p   t h e   n e w   p r o j e c t   f o l d e r ,   s e t u p   d o c ,   &   i r - l o c a l   f o r   c o n v e n i e n c e� ��� I ���Y��X
�Y .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� 
 o p e n  � o  ���W�W 0 pfolder  � m  ���� ���   � o  ���V�V 0 pfolder  � m  ���� ���  /� o  ���U�U 0 c  � m  ���� ���  S e t u p . t x t� m  ���� ���   � o  ���T�T 0 pfolder  � m  ���� ��� ( / A s s e t s / i r - l o c a l . c s s�X  � ��� l ���S�R�Q�S  �R  �Q  � ��� l ���P���P  � G A Provide option to upload assets now, or quit and come back later   � ��� �   P r o v i d e   o p t i o n   t o   u p l o a d   a s s e t s   n o w ,   o r   q u i t   a n d   c o m e   b a c k   l a t e r� ��O� I ���N��
�N .sysodlogaskr        TEXT� m  ���� ���  U p l o a d   a s s e t s ?� �M��
�M 
btns� J  ���� ��� m  ���� ���  Y e s   p l e a s e� ��L� m  ���� ���  N o t   n o w�L  � �K��
�K 
dflt� m  ���� ���  Y e s   p l e a s e� �J��I
�J 
cbtn� m  ���� ���  N o t   n o w�I  �O  ��  ��  ��  ��   } ��� l     �H�G�F�H  �G  �F  � ��� l     �E���E  � k e Begin code to upload assets. Ask for demo base URL and shortname, set as "targetURL" and "shortname"   � ��� �   B e g i n   c o d e   t o   u p l o a d   a s s e t s .   A s k   f o r   d e m o   b a s e   U R L   a n d   s h o r t n a m e ,   s e t   a s   " t a r g e t U R L "   a n d   " s h o r t n a m e "� ��� l ���D�C� r  ���� c  ���� n  ���� 1  �B
�B 
ttxt� l ���A�@� I ��?��
�? .sysodlogaskr        TEXT� m  ���� ��� � P l e a s e   e n t e r   t h e   d e m o   b a s e   u r l   ( f r o m   d e m o   f o l d e r   s t r u c t u r e )   ( n o   h t t p : / /   o r   e n d i n g   / ) :� �>��=
�> 
dtxt� m  ���� ���  �=  �A  �@  � m  �<
�< 
TEXT� o      �;�; 0 	targeturl 	targetURL�D  �C  � ��� l     �:�9�8�:  �9  �8  � ��� l     �7���7  � h b If we're implementing a journal or event, ask for the site-level shortname so we can update later   � ��� �   I f   w e ' r e   i m p l e m e n t i n g   a   j o u r n a l   o r   e v e n t ,   a s k   f o r   t h e   s i t e - l e v e l   s h o r t n a m e   s o   w e   c a n   u p d a t e   l a t e r� ��� l B��6�5� Q  B���� l ���� o  �4�4 0 irshortname irShortname� Q Kif we just set up a header-only project folder, we already have irShortname   � ��� � i f   w e   j u s t   s e t   u p   a   h e a d e r - o n l y   p r o j e c t   f o l d e r ,   w e   a l r e a d y   h a v e   i r S h o r t n a m e� R      �3�2�1
�3 .ascrerr ****      � ****�2  �1  � Z  B���0�� =   � � o  �/�/ 0 c    m   �  S i t e� r  #* o  #&�.�. 0 	shortname   o      �-�- 0 irshortname irShortname�0  � r  -B c  -> n  -<	
	 1  8<�,
�, 
ttxt
 l -8�+�* I -8�)
�) .sysodlogaskr        TEXT m  -0 � H P l e a s e   e n t e r   t h e   I R - l e v e l   s h o r t n a m e : �(�'
�( 
dtxt m  14 �  �'  �+  �*   m  <=�&
�& 
TEXT o      �%�% 0 irshortname irShortname�6  �5  �  l     �$�#�"�$  �#  �"    l     �!�!   � � Set up a path to the asset folder on local machine - customize this for whatever folder structure you use to hold project files    �    S e t   u p   a   p a t h   t o   t h e   a s s e t   f o l d e r   o n   l o c a l   m a c h i n e   -   c u s t o m i z e   t h i s   f o r   w h a t e v e r   f o l d e r   s t r u c t u r e   y o u   u s e   t o   h o l d   p r o j e c t   f i l e s  l CZ� � r  CZ b  CV  b  CR!"! b  CN#$# b  CL%&% b  CH'(' m  CF)) �** N / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s /( o  FG�� 0 c  & m  HK++ �,,  s /$ o  LM�� 0 c  " m  NQ-- �..  - d e s i g n s /  o  RU�� 0 	shortname   o      �� 0 pfolder  �   �   /0/ l     ����  �  �  0 121 l     �34�  3 ^ X Open a window in Terminal, log in to demo, and make a folder to hold assets temporarily   4 �55 �   O p e n   a   w i n d o w   i n   T e r m i n a l ,   l o g   i n   t o   d e m o ,   a n d   m a k e   a   f o l d e r   t o   h o l d   a s s e t s   t e m p o r a r i l y2 676 l [�8��8 O  [�9:9 k  a�;; <=< r  al>?> I ah�@�
� .coredoscnull��� ��� ctxt@ l adA��A m  adBB �CC  d e m o�  �  �  ? o      �� 0 demotab demoTab= DED I mt�F�
� .sysodelanull��� ��� nmbrF m  mp�� 
�  E G�G I u��HI
� .coredoscnull��� ��� ctxtH l u|J�
�	J b  u|KLK m  uxMM �NN  m k d i r   ~ / t m p /L o  x{�� 0 	shortname  �
  �	  I �O�
� 
kfilO o  ��� 0 demotab demoTab�  �  : m  [^PP�                                                                                      @ alis    <  Macintosh HD                   BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   &/:Applications:Utilities:Terminal.app/    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  �  �  7 QRQ l     ����  �  �  R STS l     �UV�  U = 7 scp assets from local asset folder to temp demo folder   V �WW n   s c p   a s s e t s   f r o m   l o c a l   a s s e t   f o l d e r   t o   t e m p   d e m o   f o l d e rT XYX l ��Z� ��Z I ����[��
�� .sysoexecTEXT���     TEXT[ b  ��\]\ b  ��^_^ b  ��`a` b  ��bcb m  ��dd �ee  s c p   - r  c o  ������ 0 pfolder  a m  ��ff �gg * / A s s e t s / *   d e m o : ~ / t m p /_ o  ������ 0 	shortname  ] m  ��hh �ii  / .��  �   ��  Y jkj l     ��������  ��  ��  k lml l     ��no��  n q k In the Terminal window where we're logged in to demo, sudo as demo, change to the demo site's asset folder   o �pp �   I n   t h e   T e r m i n a l   w i n d o w   w h e r e   w e ' r e   l o g g e d   i n   t o   d e m o ,   s u d o   a s   d e m o ,   c h a n g e   t o   t h e   d e m o   s i t e ' s   a s s e t   f o l d e rm qrq l �hs����s O  �htut k  �gvv wxw I ����yz
�� .coredoscnull��� ��� ctxty l ��{����{ m  ��|| �}}  s u d o   s u   -   d e m o��  ��  z ��~��
�� 
kfil~ o  ������ 0 demotab demoTab��  x � Z  �������� =  ����� o  ������ 0 c  � m  ���� ���  S i t e� I ������
�� .coredoscnull��� ��� ctxt� l �������� b  ����� b  ����� m  ���� ��� $ c d   $ F I L E T R E E / d a t a /� o  ������ 0 	targeturl 	targetURL� m  ���� ���  / a s s e t s��  ��  � �����
�� 
kfil� o  ������ 0 demotab demoTab��  ��  � I ������
�� .coredoscnull��� ��� ctxt� l �������� b  ����� b  ����� b  ����� b  ����� m  ���� ��� 6 c d   $ F I L E T R E E / d a t a / j o u r n a l s /� o  ������ 0 	targeturl 	targetURL� m  ���� ���  /� o  ������ 0 	shortname  � m  ���� ���  / a s s e t s��  ��  � �����
�� 
kfil� o  ������ 0 demotab demoTab��  � ��� l ��������  � 4 . check if directory exists, let us know if not   � ��� \   c h e c k   i f   d i r e c t o r y   e x i s t s ,   l e t   u s   k n o w   i f   n o t� ��� I �������
�� .sysodelanull��� ��� nmbr� m  ������ ��  � ��� r  ���� n  ���� 1  ���
�� 
hist� o  ������ 0 demotab demoTab� o      ���� 0 histtext histText� ��� W  ���� k  ��� ��� I �����
�� .sysodlogaskr        TEXT� m  �� ��� T D i r e c t o r y   n o t   f o u n d ,   c h a n g e   d e m o   b a s e   u r l ?��  � ��� r  /��� c  +��� n  )��� 1  %)��
�� 
ttxt� l %������ I %����
�� .sysodlogaskr        TEXT� m  �� ��� � P l e a s e   e n t e r   t h e   d e m o   b a s e   u r l   ( f r o m   d e m o   f o l d e r   s t r u c t u r e )   ( n o   h t t p : / /   o r   e n d i n g   / ) :� �����
�� 
dtxt� m  !�� ���  ��  ��  ��  � m  )*��
�� 
TEXT� o      ���� 0 	targeturl 	targetURL� ��� Z  0m������ =  05��� o  01���� 0 c  � m  14�� ���  S i t e� I 8M����
�� .coredoscnull��� ��� ctxt� l 8C������ b  8C��� b  8?��� m  8;�� ��� $ c d   $ F I L E T R E E / d a t a /� o  ;>���� 0 	targeturl 	targetURL� m  ?B�� ���  / a s s e t s��  ��  � �����
�� 
kfil� o  FI���� 0 demotab demoTab��  ��  � I Pm����
�� .coredoscnull��� ��� ctxt� l Pc������ b  Pc��� b  P_��� b  P[��� b  PW��� m  PS�� ��� 6 c d   $ F I L E T R E E / d a t a / j o u r n a l s /� o  SV���� 0 	targeturl 	targetURL� m  WZ�� ���  /� o  [^���� 0 	shortname  � m  _b�� ���  / a s s e t s��  ��  � �����
�� 
kfil� o  fi���� 0 demotab demoTab��  � ��� I nu�����
�� .sysodelanull��� ��� nmbr� m  nq���� ��  � ���� r  v���� n  v}��� 1  y}��
�� 
hist� o  vy���� 0 demotab demoTab� o      ���� 0 histtext histText��  � E  
��� o  
���� 0 histtext histText� m  �� �   < d e m o @ d e m o : / m a i n / d e m o / d o c / d a t a /�  l ����������  ��  ��    l ������   E ? copy files to demo site from our temp demo folder, then update    � ~   c o p y   f i l e s   t o   d e m o   s i t e   f r o m   o u r   t e m p   d e m o   f o l d e r ,   t h e n   u p d a t e 	 I ����

�� .coredoscnull��� ��� ctxt
 l ������ b  �� b  �� m  �� � , c p   / h o m e / j w a r d l o w / t m p / o  ������ 0 	shortname   m  �� �  / *   .��  ��   ����
�� 
kfil o  ������ 0 demotab demoTab��  	  Z  ���� =  �� o  ������ 0 c   m  �� �  S i t e I ���� 
�� .coredoscnull��� ��� ctxt l ��!����! b  ��"#" b  ��$%$ m  ��&& �'' H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .% o  ������ 0 irshortname irShortname# m  ��(( �))  . b e p r e s s . c o m /��  ��    ��*��
�� 
kfil* o  ������ 0 demotab demoTab��  ��   I ����+,
�� .coredoscnull��� ��� ctxt+ l ��-����- b  ��./. b  ��010 b  ��232 m  ��44 �55 H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .3 o  ������ 0 irshortname irShortname1 m  ��66 �77  . b e p r e s s . c o m // o  ������ 0 	shortname  ��  ��  , ��8��
�� 
kfil8 o  ������ 0 demotab demoTab��   9:9 l ����;<��  ; > 8 check if update failed, let us know and try again if so   < �== p   c h e c k   i f   u p d a t e   f a i l e d ,   l e t   u s   k n o w   a n d   t r y   a g a i n   i f   s o: >?> I ����@��
�� .sysodelanull��� ��� nmbr@ m  ������ ��  ? ABA r  ��CDC n  ��EFE 1  ����
�� 
histF o  ������ 0 demotab demoTabD o      ���� 0 histtext histTextB G��G W  �gHIH k  �bJJ KLK I ����M��
�� .sysodlogaskr        TEXTM m  ��NN �OO R U p d a t e   f a i l e d ,   c h a n g e   I R - l e v e l   s h o r t n a m e ?��  L PQP r  �RSR c  �TUT n  �VWV 1  
��
�� 
ttxtW l �
X����X I �
��YZ
�� .sysodlogaskr        TEXTY m  �[[ �\\ H P l e a s e   e n t e r   t h e   I R - l e v e l   s h o r t n a m e :Z ��]��
�� 
dtxt] m  ^^ �__  ��  ��  ��  U m  ��
�� 
TEXTS o      ���� 0 irshortname irShortnameQ `a` Z  Nbc��db =  efe o  ���� 0 c  f m  gg �hh  S i t ec I 2��ij
�� .coredoscnull��� ��� ctxti l (k����k b  (lml b  $non m   pp �qq H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .o o   #���� 0 irshortname irShortnamem m  $'rr �ss  . b e p r e s s . c o m /��  ��  j �t�~
� 
kfilt o  +.�}�} 0 demotab demoTab�~  ��  d I 5N�|uv
�| .coredoscnull��� ��� ctxtu l 5Dw�{�zw b  5Dxyx b  5@z{z b  5<|}| m  58~~ � H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .} o  8;�y�y 0 irshortname irShortname{ m  <?�� ���  . b e p r e s s . c o m /y o  @C�x�x 0 	shortname  �{  �z  v �w��v
�w 
kfil� o  GJ�u�u 0 demotab demoTab�v  a ��� I OV�t��s
�t .sysodelanull��� ��� nmbr� m  OR�r�r �s  � ��q� r  Wb��� n  W^��� 1  Z^�p
�p 
hist� o  WZ�o�o 0 demotab demoTab� o      �n�n 0 histtext histText�q  I E  ����� o  ���m�m 0 histtext histText� m  ���� ���  P u b l i s h . p u b l i s h��  u m  �����                                                                                      @ alis    <  Macintosh HD                   BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   &/:Applications:Utilities:Terminal.app/    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  ��  ��  r ��� l     �l�k�j�l  �k  �j  � ��� l     �i���i  � �  Now that the initial batch of assets is in place, provide options to upload new versions of templates as we work on the design   � ��� �   N o w   t h a t   t h e   i n i t i a l   b a t c h   o f   a s s e t s   i s   i n   p l a c e ,   p r o v i d e   o p t i o n s   t o   u p l o a d   n e w   v e r s i o n s   o f   t e m p l a t e s   a s   w e   w o r k   o n   t h e   d e s i g n� ��h� l i���g�f� T  i��� k  n��� ��� r  n���� n  n���� 1  ���e
�e 
bhit� l n���d�c� I n��b��
�b .sysodlogaskr        TEXT� m  nq�� ��� R U p l o a d   i n   p r o g r e s s !   U p l o a d   a   n e w   v e r s i o n ?� �a��
�a 
btns� J  t�� ��� m  tw�� ���  i r - l o c a l . c s s� ��� m  wz�� ���  S o m e t h i n g   e l s e� ��`� m  z}�� ���  A l l   d o n e�`  � �_��^
�_ 
cbtn� m  ���� ���  A l l   d o n e�^  �d  �c  � o      �]�] 0 btnreturned btnReturned� ��\� Z  �����[�� =  ����� o  ���Z�Z 0 btnreturned btnReturned� m  ���� ���  i r - l o c a l . c s s� k  �
�� ��� I ���Y��X
�Y .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� m  ���� ���  s c p   - r  � o  ���W�W 0 pfolder  � m  ���� ��� @ / A s s e t s / i r - l o c a l . c s s   d e m o : ~ / t m p /� o  ���V�V 0 	shortname  � m  ���� ���  / .�X  � ��U� O  �
��� k  �	�� ��� I ���T��
�T .coredoscnull��� ��� ctxt� l ����S�R� b  ����� b  ����� m  ���� ��� , c p   / h o m e / j w a r d l o w / t m p /� o  ���Q�Q 0 	shortname  � m  ���� ���  / i r - l o c a l . c s s   .�S  �R  � �P��O
�P 
kfil� o  ���N�N 0 demotab demoTab�O  � ��M� Z  �	���L�� =  ����� o  ���K�K 0 c  � m  ���� ���  S i t e� I ���J��
�J .coredoscnull��� ��� ctxt� l ����I�H� b  ����� b  ����� m  ���� ��� v $ F I L E T R E E / b i n / u p d a t e . p l   - t e m p l a t e = i r - l o c a l . c s s   h t t p : / / d e m o .� o  ���G�G 0 irshortname irShortname� m  ���� ���  . b e p r e s s . c o m /�I  �H  � �F��E
�F 
kfil� o  ���D�D 0 demotab demoTab�E  �L  � I �	�C��
�C .coredoscnull��� ��� ctxt� l ����B�A� b  ����� b  ����� b  ����� m  ��   � v $ F I L E T R E E / b i n / u p d a t e . p l   - t e m p l a t e = i r - l o c a l . c s s   h t t p : / / d e m o .� o  ���@�@ 0 irshortname irShortname� m  �� �  . b e p r e s s . c o m /� o  ���?�? 0 	shortname  �B  �A  � �>�=
�> 
kfil o  �<�< 0 demotab demoTab�=  �M  � m  ���                                                                                      @ alis    <  Macintosh HD                   BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   &/:Applications:Utilities:Terminal.app/    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  �U  �[  � k  �  r  "	
	 c   n   1  �;
�; 
ttxt l �:�9 I �8
�8 .sysodlogaskr        TEXT m   � 8 E n t e r   a   f i l e   n a m e   t o   u p l o a d : �7�6
�7 
dtxt m   �  �6  �:  �9   m  �5
�5 
TEXT
 o      �4�4 0 template    I #B�3�2
�3 .sysoexecTEXT���     TEXT b  #> b  #: b  #6 b  #2 !  b  #."#" b  #*$%$ m  #&&& �''  s c p   - r  % o  &)�1�1 0 pfolder  # m  *-(( �))  / A s s e t s /! o  .1�0�0 0 template   m  25** �++    d e m o : ~ / t m p / o  69�/�/ 0 	shortname   m  :=,, �--  / .�2   .�.. O  C�/0/ k  I�11 232 I If�-45
�- .coredoscnull��� ��� ctxt4 l I\6�,�+6 b  I\787 b  IX9:9 b  IT;<; b  IP=>= m  IL?? �@@ , c p   / h o m e / j w a r d l o w / t m p /> o  LO�*�* 0 	shortname  < m  PSAA �BB  /: o  TW�)�) 0 template  8 m  X[CC �DD    .�,  �+  5 �(E�'
�( 
kfilE o  _b�&�& 0 demotab demoTab�'  3 F�%F Z  g�GH�$IG =  glJKJ o  gh�#�# 0 c  K m  hkLL �MM  S i t eH I o��"NO
�" .coredoscnull��� ��� ctxtN l ozP�!� P b  ozQRQ b  ovSTS m  orUU �VV H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .T o  ru�� 0 irshortname irShortnameR m  vyWW �XX  . b e p r e s s . c o m /�!  �   O �Y�
� 
kfilY o  }��� 0 demotab demoTab�  �$  I I ���Z[
� .coredoscnull��� ��� ctxtZ l ��\��\ b  ��]^] b  ��_`_ b  ��aba m  ��cc �dd H $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o .b o  ���� 0 irshortname irShortname` m  ��ee �ff  . b e p r e s s . c o m /^ o  ���� 0 	shortname  �  �  [ �g�
� 
kfilg o  ���� 0 demotab demoTab�  �%  0 m  CFhh�                                                                                      @ alis    <  Macintosh HD                   BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   &/:Applications:Utilities:Terminal.app/    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  �.  �\  �g  �f  �h       �ijklmnopqrstuvwx��  i ��������
�	�������
� .aevtoappnull  �   � ****� 0 c  � 0 	shortname  � 0 task  � 0 	targeturl 	targetURL� 0 irshortname irShortname� 0 pfolder  �
 0 demotab demoTab�	 0 histtext histText� 0 btnreturned btnReturned� 0 
headeronly 
headerOnly� 0 tfolder  � 0 rfolder  � 0 cpcmd cpCmd� 0 template  �  j �y� ��z{��
� .aevtoappnull  �   � ****y k    �||  
}}  ,~~  A  T��  |�� ��� ��� �� 6�� X�� q�� �����  �   ��  z  { �   ��  �� #������������ M�� P������ ^�� e i l�� p�� s������ � � � � ��� � � ��� � ��� � � ��� � �����*,��@������NPfhjy}������������������)+-PB��������M��dfh|����������������������&(46�N[^gpr~����������������� ��&(*,?ACLUWce
�� 
prmp
�� 
inSL�� 
�� .gtqpchltns    @   @ ns  �� 0 c  
�� 
errn����
�� 
TEXT
�� 
dtxt
�� .sysodlogaskr        TEXT
�� 
ttxt�� 0 	shortname  
�� 
btns
�� 
dflt
�� 
cbtn�� 
�� 
bhit�� 0 task  �� 0 
headeronly 
headerOnly�� 0 pfolder  
�� 
bool�� 0 tfolder  �� 0 irshortname irShortname�� 0 rfolder  �� 0 cpcmd cpCmd
�� .sysoexecTEXT���     TEXT��  ��  �� 0 	targeturl 	targetURL
�� .coredoscnull��� ��� ctxt�� 0 demotab demoTab�� 

�� .sysodelanull��� ��� nmbr
�� 
kfil�� 
�� 
hist�� 0 histtext histText�� 0 btnreturned btnReturned�� 0 template  ������mv����� E�O�f  )��lhY ��&E�O���l a ,�&E` Oa a a a a mva a a a a  a ,E` O_ a  ��a   !a !a a "a #lvl a ,�&E` $Y hOa %�%a &%�%a '%_ %E` (O�a )	 _ $a * a +& .a ,�%a -%�%a .%E` /Oa 0�a 1l a ,�&E` 2Y a 3�%a 4%�%a 5%E` /O_ (a 6%E` 7Oa 8_ /%a 9%_ (%E` :O a ;_ (%j <O_ :j <W "X = >a ?_ (%a @%_ 7%j <O_ :j <Oa A_ (%a B%_ %a C%j <O�a D	 _ $a E a +& a F_ 2%a G%_ (%a H%j <Y hOa I_ (%a J%_ (%a K%�%a L%a M%_ (%a N%j <Oa Oa a Pa Qlva a Ra a Sa  Y hOa T�a Ul a ,�&E` VO _ 2W .X = >�a W  _ E` 2Y a X�a Yl a ,�&E` 2Oa Z�%a [%�%a \%_ %E` (Oa ] 'a ^j _E` `Oa aj bOa c_ %a d_ `l _UOa e_ (%a f%_ %a g%j <Oa ]�a ha d_ `l _O�a i  a j_ V%a k%a d_ `l _Y a l_ V%a m%_ %a n%a d_ `l _Oa oj bO_ `a p,E` qO h_ qa ra sj Oa t�a ul a ,�&E` VO�a v  a w_ V%a x%a d_ `l _Y a y_ V%a z%_ %a {%a d_ `l _Oa oj bO_ `a p,E` q[OY��Oa |_ %a }%a d_ `l _O�a ~  a _ 2%a �%a d_ `l _Y a �_ 2%a �%_ %a d_ `l _Oa oj bO_ `a p,E` qO {h_ qa �a �j Oa ��a �l a ,�&E` 2O�a �  a �_ 2%a �%a d_ `l _Y a �_ 2%a �%_ %a d_ `l _Oa oj bO_ `a p,E` q[OY��UO<hZa �a a �a �a �mva a �� a ,E` �O_ �a �  sa �_ (%a �%_ %a �%j <Oa ] Qa �_ %a �%a d_ `l _O�a �  a �_ 2%a �%a d_ `l _Y a �_ 2%a �%_ %a d_ `l _UY �a ��a �l a ,�&E` �Oa �_ (%a �%_ �%a �%_ %a �%j <Oa ] Ya �_ %a �%_ �%a �%a d_ `l _O�a �  a �_ 2%a �%a d_ `l _Y a �_ 2%a �%_ %a d_ `l _U[OY��k ��� 
 E v e n tl ���  w t e lm ���  M a k e   n e w   f o l d e rn ��� & s c h o l a r . u w i n d s o r . c ao ���  u w i n d s o rp ��� � / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / E v e n t s / E v e n t - d e s i g n s / w t e lq �� ������ P������
�� 
cwin��s
�� kfrmID  
�� 
ttab�� r ���� L a s t   l o g i n :   T h u   M a r   3 1   1 7 : 0 3 : 3 0   o n   t t y s 0 0 0 
 E L S B K Y M - 1 5 9 9 4 8 : ~   w a r d l o w j $   d e m o 
 W a r n i n g :   t h e   E C D S A   h o s t   k e y   f o r   ' b a s t i o n . u s - w e s t - 1 . r o o t . b e p r e s s . c o m '   d i f f e r s   f r o m   t h e   k e y   f o r   t h e   I P   a d d r e s s   ' 1 0 0 . 6 4 . 1 . 6 4 ' 
 O f f e n d i n g   k e y   f o r   I P   i n   / U s e r s / w a r d l o w j / . s s h / k n o w n _ h o s t s : 5 9 
 M a t c h i n g   h o s t   k e y   i n   / U s e r s / w a r d l o w j / . s s h / k n o w n _ h o s t s : 6 8 
 W a r n i n g :   P e r m a n e n t l y   a d d e d   ' d e m o . w e b . b e p r e s s a w s . c o m '   ( R S A )   t o   t h e   l i s t   o f   k n o w n   h o s t s . 
 L i n u x   d e m o . w e b . b e p r e s s . c o m   2 . 6 . 3 2 - 5 - x e n - a m d 6 4   # 1   S M P   W e d   F e b   1 8   1 4 : 2 4 : 3 0   U T C   2 0 1 5   x 8 6 _ 6 4 
 
 T h e   p r o g r a m s   i n c l u d e d   w i t h   t h e   D e b i a n   G N U / L i n u x   s y s t e m   a r e   f r e e   s o f t w a r e ; 
 t h e   e x a c t   d i s t r i b u t i o n   t e r m s   f o r   e a c h   p r o g r a m   a r e   d e s c r i b e d   i n   t h e 
 i n d i v i d u a l   f i l e s   i n   / u s r / s h a r e / d o c / * / c o p y r i g h t . 
 
 D e b i a n   G N U / L i n u x   c o m e s   w i t h   A B S O L U T E L Y   N O   W A R R A N T Y ,   t o   t h e   e x t e n t 
 p e r m i t t e d   b y   a p p l i c a b l e   l a w . 
 L a s t   l o g i n :   T h u   M a r   3 1   1 6 : 5 3 : 3 3   2 0 2 2   f r o m   1 0 . 9 0 . 1 . 1 3 1 
 j w a r d l o w @ d e m o : ~ $   m k d i r   ~ / t m p / w t e l 
 m k d i r :   c a n n o t   c r e a t e   d i r e c t o r y   ` / h o m e / j w a r d l o w / t m p / w t e l ' :   F i l e   e x i s t s 
 j w a r d l o w @ d e m o : ~ $   s u d o   s u   -   d e m o 
 d e m o @ d e m o : ~ $   c d   $ F I L E T R E E / d a t a / j o u r n a l s / s c h o l a r . u w i n d s o r . c a / w t e l / a s s e t s 
 d e m o @ d e m o : / m a i n / d e m o / d o c / d a t a / j o u r n a l s / s c h o l a r . u w i n d s o r . c a / w t e l / a s s e t s $   c p   / h o m e / j w a r d l o w / t m p / w t e l / *   . 
 d e m o @ d e m o : / m a i n / d e m o / d o c / d a t a / j o u r n a l s / s c h o l a r . u w i n d s o r . c a / w t e l / a s s e t s $   $ F I L E T R E E / b i n / u p d a t e . p l   h t t p : / / d e m o . u w i n d s o r . b e p r e s s . c o m / w t e l 
 [ 1 7 : 0 3 : 5 6 ]   I N F O   P u b l i s h . p u b l i s h   C o n t e x t   ( 1 5 3 6 2 2 9 )   s h o u l d   a u t o c o l l e c t   S W   d a t a   a n d   w e   a r e   a b o u t   t o   c a l l   S e l e c t e d W o r k s : : G a l l e r y : : c o n t r o l l e r _ s w i t c h 
 d e m o @ d e m o : / m a i n / d e m o / d o c / d a t a / j o u r n a l s / s c h o l a r . u w i n d s o r . c a / w t e l / a s s e t s $   
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
s ���  S o m e t h i n g   e l s et ���  Y e su ��� � / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / E v e n t s / E v e n t - t e m p l a t e s - h e a d e r - o n l y /v ��� � / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / E v e n t s / E v e n t - d e s i g n s / w t e l - o gw ���" c p   - R   / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / E v e n t s / E v e n t - t e m p l a t e s - h e a d e r - o n l y /   / U s e r s / w a r d l o w j / D e s i g n / I m p l e m e n t a t i o n s / E v e n t s / E v e n t - d e s i g n s / w t e lx ���   h e a d e r b a n n e r . j p g�   ascr  ��ޭ