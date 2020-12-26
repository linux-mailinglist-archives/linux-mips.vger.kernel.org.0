Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2495F2E2D98
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 08:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgLZHaD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 02:30:03 -0500
Received: from mout.gmx.net ([212.227.15.15]:55121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgLZHaD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Dec 2020 02:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608967709;
        bh=5EGGxYY+QyFx/0c6dDtARQhoApoCLGyZ2w8sLdQdgSM=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Ju+o9qTBJIXyX3a3wFMIWPX6ZktCFpGnQ9obZYchQh3VEInv4TzCGp33oisliVVEU
         sRYlatrMJZdnuVlL5vBHs1Tyk+Umn7FXXNEwals/MsDkay6+iOZis4k/mHq67xBDsl
         GLPGQEvMyltY7Yx31s5HECcrEtakXg+mzwHaVLmk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MqJqD-1kF2I33LIR-00nQ5S; Sat, 26
 Dec 2020 08:28:28 +0100
Date:   Sat, 26 Dec 2020 09:30:05 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
Message-Id: <20201226093005.c9bbd6a2167aa3c989294c3e@gmx.com>
In-Reply-To: <cb037083-fb29-e080-c2f0-532f38abb9d6@flygoat.com>
References: <20201225190016.286a0dfe49385f2bc39d04d4@gmx.com>
        <cb037083-fb29-e080-c2f0-532f38abb9d6@flygoat.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RtKnpcqVGWsO6A6/erbrrwaFS+qWyp3ygwcNeWvL1gM8DQ5Qa78
 TX9Csd+gnYvShK5MXNITwuKgfqOonlBceGwxsIiby3BoOK3gejRhz0bFLWpxqwgUpTSlIqY
 zpP3iOb6fh/POi32J0IP0OhAMbhoNOCrqdQgLui83vxvii/DBPox6RoATrYYRMeeIc2zRrt
 zkFagtOs3BuYJqcYBLPkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:64XXOI0Zp9s=:eAWcv4FxsFzAPx3FxKWLtN
 nGc0aQvSJt4PKQyWsFAMAK/SBd9X0+PIyJ++xUVzuFu5NpUsZ733RBaOTnAVlPkdETEFCMQXJ
 jDlN/eC1UMk5GqyyaYuRsJxmnnQQ1GV80jbU1ZB2tJ6WIBhvnzEWLxaN6r+4/TB9UYg2SRrBT
 J0V4aRzA/LTLGl+yvKi9ZT9vj+vfLa5VLQ+AKW50jHF/FYToUxpB9sNTdquESheSvVG+tSmMF
 egTJ+7Kx+QloEA3n/hSJnVr4JT2my2ypOOvE+yxA3xkuUBtjf0aitII/KIdbp9UH9COvO7C1O
 BqekavuWyiuxrE9B45AmW2UjiCpNjjOTp6Ok7S/h3FI+ANt87h3lsBMo/6DErFqcmXu2t/nxQ
 3zTg6eKp4yyiTt3o/u7woGCjoOfVtiOk3BIPC3QzgKdzIXCiWjrqgItJv/EgyxvtWxf90y3c4
 V3RD647Wnl7MKWVq4rP1Uyr9xI8mlZeDc18Hotp2IhSndTVRhmiSWIsU2d4OUMNu+MG4TFtSM
 NkZbuoJgwJTutzOkcy1KRjFyyGGzABh9u/G5nNkARer9m5BSuRqgSxODCKjQy+wvPwF3Apazw
 zsFbzfxmpRj1xmkx2tRGzdKdHo3hmcg/SZ1EFYW/xIlYTRhcIaPubTJznyNf2eSuPUlFbBLP8
 zMkGa216a4aKzoRi79Z5i0SreMsuVDo1Uxd874jsvR4UqlyLSd3lYj2aUJHpXhshiPCZDLB1C
 adEGX735iTrqbjC4PZJmkHpHK+KmpW/ErPSzN8fl5CQF3eG9m9zl2VQznG3inkXLyL0at5FSk
 BUNUTC8HOZNThQIZwa5j66RPFEgGNGSiMEHmic1SWPnWl1wdI8i+OVJ7ZFt1ExMEOVGlDY0ep
 8DOYVz9SREM3uEBSyD4Q==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 26 Dec 2020 11:17:42 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> > +++ b/arch/mips/n64/init.c
> > +void __init prom_init(void)
> > +{
> > +	int argc, i;
> > +	const char **argv;
> > +
> > +	argc =3D fw_arg0;
> > +	argv =3D (const char **)fw_arg1;
> > +
> > +	for (i =3D 1; i < argc; i++) {
> > +		strlcat(arcs_cmdline, argv[i], COMMAND_LINE_SIZE);
> > +		if (i < (argc - 1))
> > +			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
> > +	}
> > +}
>
> Please use: fw_init_cmdline.

Will do.

This was copypaste from vr41xx - that place should also be changed then
(by someone who can test it).

> > +++ b/arch/mips/n64/irq.c
> Actually we have plat_irq_dispatch at irq-mips-cpu.c.
> Any special reason to override it?

No, I just didn't know of it. The nicer #define names can still be used
in drivers.

- Lauri
