Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA5C223017
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 02:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgGQApo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 20:45:44 -0400
Received: from sonic314-21.consmr.mail.ne1.yahoo.com ([66.163.189.147]:41005
        "EHLO sonic314-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgGQApn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 20:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1594946743; bh=GR4TRCXK6wRteJXXqtI/y/2pwYNeSYeNMXUPo1+ojQ4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=dL1gQX6FsaygUNIciTOKEmEu+NTUnVqzvtAyKcbTitHuyetclTkEkQTv5iFWi2TLsLYg5Me15+3e7WCwFl10nazybzgWQhJRRsiN8wCkHz9+b7rPohyAcExGo8KySVvHiegItJ3zDi3Hzu5E9gar+uJgJ2iJ5GKfyB/p3+uC2InfGvP8hv5C5o+p9Fo/wsVToz+ZWlzpOwF7c5lPA+sr7yH6mj/0iQkzMkre8nps8qntDQdnUZIspUbtklu7RC1T6KTKrBkzalc4iQwXnu1PVSHXihAYI7F9iNUuJVyA4EaLHsC0pboBBL6OMM/UhD4XEXrut3V1ymQ3wUUOoobkgw==
X-YMail-OSG: cR2giLUVM1kWklA9tplsp.jPozlvucXEOHQkpr_GDRqDm2jwjq.5kqqeq8HcvKt
 VfxqHApTPZ_giGkozPnlwoSV7RGpw4uhKc1nkxByJ6.j_mqQXB.vbRYb.9C8BF4zBk3tVp8xLt60
 oY6r0yVPp7s4qDim8MCQ97p2DRavmdkV1gsqyN9x4G7Ra_ekVjBpbPA3KxznRl44w6NOhePZsBG7
 ZZuvVx_INpIANLMmtM6EoDqhEK3enupTY8HZQQp8.xKeUia34wZFOFUe_ItYyV1jCwLGZxHyOwqf
 JDMcW0DF3tfSQJBp_43_148zO5qAgyIOeLMYyhkk85tHW._2a2vO6urnog0DtiCPgRXhhlk8Jnwg
 Ds66wkmFlGYArP8ql4zTdiBJMrE1Pat9sERtTEG4ArBRXp7VZyExfcbs7DU.hCbq.OUAxFFEsCbK
 .riSVfodTZ_D9fKBn7ZaLrl7h_9pB9y4qt05X6lMe5qB7_nRDRJpRzMa7.HVeYrMifhBUO4edc.Q
 D8DPe7xX6WKmp9taQyVbRlAfKvGBHTpJ4NCzMVJNpn9D38ZKnaqx1KO7qP8yco9ddb_yDFxgnt25
 l4_p31jmmkBDKbAM8prAlTBMMSd9Rj2WDYPzNv.hodtgkpBVTP_TuarKZm1nS4_ZilzQHtdF3Fep
 xHZnzjDGeQTQC_cn1Oy.Cc4NEU8K5uXoPbb__hKS6ZI3mPMv1cvloj4Ayez8aWreiwd9L0E5PPC3
 dUrF7r6c4o_jhFHpIGsm8z79gbYV8ymjghZVZXH0vUU3r220fji1149tvV31HRc1XjO9zzvy.tp0
 xhUoO_kentJ0mg3G7nHNVX7h_wASSoB5ImBe7Gg4aTKMCWVnUjNGoZaJQ2XFNIQG9YWResFhXFXH
 23V5CBeL0oXpox2XtjYo0x1ojOqOo.fbORYWQDRgnWwjZVpeAkzcCjwevwmeu31zDOqXrNLPB2kC
 4mPrIszRhRF6GWgaI0pCeJ.dKBMka80X3q6QUV68yySv4Dd0jqEBzqRiXBC0e4MeFoEmIZoD5hJR
 raaVh1HqTQqM0Qh9RWOh1JwlZe8Y6KF5lznBbHMO1I7GL.yuzOmyzVAfCDAI46SjMA7jFeRPYhBo
 bGEE8fXfAnW55vbJOoaif5rJhT412HZ9woSnt5TkkFwys3MYcVC.wa7GIPGWB8GevAzPuNRgm1v9
 cXaOAAhnvxfUTgGCDL8FevmFd.sFLX1Zyokqf5y2lhwHR77md2IXx6USqMmssFNbFC5LCPcSkhJn
 X98UCB56dpG9Xo4l7MYXGi3tE7DgdaWze_fxfTxctkEf.4x7fJSFrZAQW9dadx0FcSPyovQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Fri, 17 Jul 2020 00:45:43 +0000
Date:   Fri, 17 Jul 2020 00:45:42 +0000 (UTC)
From:   Jak Abdullah mishail <mjakabdullah@gmail.com>
Reply-To: mishailjakabdullah@gmail.com
Message-ID: <609068648.2948766.1594946742331@mail.yahoo.com>
Subject: I NEED YOUR ASSISTANCE AND CO-OPERATION TO INVEST IN YOUR COUNTRY,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <609068648.2948766.1594946742331.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greeting,

My Name is Mr.Jak Abdullah mishail from Damascus Syria, and I am now resign=
ed from the government. I am a member of an opposition party government in =
Syria and a business man also,

I need a foreign partner to enable me transport my investment capital and t=
hen Relocate with my family, honestly I wish I will discuss more and get al=
ong I need a partner because my investment capital is in my international a=
ccount. Am interested in buying Properties, houses, building real estates a=
nd some tourist places, my capital for investment is ($16.5 million USD) Me=
anwhile if there is any profitable investment that you have so much experie=
nce on it then we can join together as partners since I=E2=80=99m a foreign=
er.

I came across your e-mail contact through private search while in need of y=
our assistance and I decided to contact you directly to ask you if you know=
 any Lucrative Business Investment in your Country I can invest my Money si=
nce my Country Syria Security and Economic Independent has lost to the Grea=
test Lower level, and our Culture has lost forever including our happiness =
has been taken away from us. Our Country has been on fire for many years no=
w.

If you are capable of handling this business Contact me for more details i =
will appreciate it if you can contact me immediately.
You may as well tell me little more about yourself. Contact me urgently to =
enable us proceed with the business.

I will be waiting for your respond.

Sincerely Yours,

Jak Abdullah mishail
