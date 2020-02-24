Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD766169EC4
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 07:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgBXGs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 01:48:56 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:58500 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgBXGs4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Feb 2020 01:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aPzPOEhOYS+oQENKbcZiCCH54g8sQ13jYUVbMT5jUEE=; b=MKauvzKyrpIiXp8VhkLghbILf
        MVXZusn70gwuzUAU2tFUA8nRd4jSqsAQl5I1jKm+iirmod1+Rs2XqhHSjCxzFTFpcoGO1k0bUXQP+
        pqj4/MrcMf10j4vMAc55KsrOU5G3koQkLUuncnfHK0/kFAl9qoZsQFVvZ8h4DkE+6R5KM=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j67Xu-0001bc-0B; Mon, 24 Feb 2020 07:48:50 +0100
Received: from localhost ([127.0.0.1])
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j67Xr-0007GL-Je; Mon, 24 Feb 2020 07:48:47 +0100
Date:   Mon, 24 Feb 2020 07:48:04 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Rob Herring <robh@kernel.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH RFC] Bindings: nvmem: add bindings for JZ4780 efuse
Message-ID: <20200224074804.3a5999ca@kemnade.info>
In-Reply-To: <CAL_JsqKTdpbLfPq_eGUf-w-0s8JMndbMrQ2BsMt+8y+eqQ-kZw@mail.gmail.com>
References: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
        <20200220060001.25807-1-andreas@kemnade.info>
        <CAL_JsqKTdpbLfPq_eGUf-w-0s8JMndbMrQ2BsMt+8y+eqQ-kZw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qC/AVLdY9Jg/Kbhrq+v8j_Q"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/qC/AVLdY9Jg/Kbhrq+v8j_Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Feb 2020 13:53:55 -0600
Rob Herring <robh@kernel.org> wrote:

[...]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clock =20
>=20
> 'make dt_binding_check' would have pointed the error here for you:
>=20
I did run make dt_binding_check...
It stopped because the jz4780-cgu.h included was missing. Then I have added
that line and have started dt_binding_check again.
At least here it is doing a full rerun in the second part.
After some time I scrolled back and noticed DTC passed
and missed that

> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvme=
m/ingenic,jz4780-efuse.example.dt.yaml:
> efuse@134100d0: 'clock' is a required property
>=20
in the CHECKS line. Well, dt_binding_check is a bit noisy. I guess I should
have redirected all output to a text file, before and after my changes. and
diffed the results.=20
Is there any script ready for that?

Regards,
Andreas

--Sig_/qC/AVLdY9Jg/Kbhrq+v8j_Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl5TcaQACgkQl4jFM1s/
ye+qEg//RuC/awIoIvvNfAs0LvNMWhnRjEmuJCXPJv7SqCNMbgwxLpFpr8II3bid
R0XiugVmlY6N6bWBy4C2WI2Y/CYX0FxmSzD9MhhPqbD+TxuiB8PmlWdnMCbqmM8b
RWFDS1xdh3G3iEGO8+gu0arCysRAsEazkLv0PMKHX9n2Y6+qJYgPy8rbZ8ObG7tp
dJmhZQYv6FjQJ0VGl/L6RNdwBOoNX1Q3QEP/RLRLn+VAIkWWqGrAGXNMA3FznN2u
JwJZkXLUJaBi3docdXpPjtsEhZryuIjBfprsI5Q38+ot5SSboe7xUq5XzsCYzRfw
fDqhhOmdW3sou7KEBcr0NPapAnEB3PJXqaunsrgNH9oIVUudVa0FC+PVk/jZ5vk7
wO/Z349eo3lGGrKQQhxNd/sErrJi2pdRT1RqjelyFssQ7QeOOBHp8EQLeQV+R29x
q9xnDCMs5XQnxWl0+r2YlbXo0ibpe45o5jJGRjJokUFKqv6bjFlcdVtMjPhh2dK/
BrWoGGrj42ts+ZTKVt0Y2I8djhuUrc2YtXjwUv/JAAly0bE5o2acuOcKMNJMQLXM
vlieSRzztvqI8Be94byPJURtT3qSxNpHu5CYoi/cDxdWvt++LmdryRYZF7wswFO/
gtiBSIG3Xsvb6Q8poDwlcwGAxu09cdHRUm9XLzaEP3vBuo+R7RY=
=R3/0
-----END PGP SIGNATURE-----

--Sig_/qC/AVLdY9Jg/Kbhrq+v8j_Q--
