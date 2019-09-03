Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FFCA71E3
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 19:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfICRmQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 13:42:16 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:54497 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICRmQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 13:42:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 51E8E3FA5A;
        Tue,  3 Sep 2019 19:42:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 53auHPq8taU7; Tue,  3 Sep 2019 19:42:13 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 97DEE3F5F6;
        Tue,  3 Sep 2019 19:42:13 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:42:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
Message-ID: <20190903174212.GA22657@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
 <20190902144007.GA2479@sx9>
 <2ac424e5-017b-5892-ef38-fe25ec5f38d1@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ac424e5-017b-5892-ef38-fe25ec5f38d1@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> DRM do have fb_helper providing FB console.
> 
> I think refactor your current FB driver with drm gem cma helper won't be 
> very hard.

Thanks! I will update that for v2.

> Ahh, the guy runs Linux on that gaming console is really cool! How do 
> you debug your code?

The video screen is used for the earliest stages, even before the kernel
is decompressed in arch/mips/boot/compressed/decompress.c. I have a simple
patch that sets up the Graphics Synthesizer and uses DMA to render a
trivial frame buffer console, displaying

	zimage at:     00803BE0 00BDDE8C
	Uncompressing Linux at load address 80010000
	Now, booting the kernel...

and so on as a video image. This is functionally equivalent to the serial
port drivers for prom_putchar() that other MIPS platforms have, and
essential to debug early boot and kexec.

[ I assume this code will not be accepted, since the approach is rather
nontraditional, which is why I didn't include it in the patch set. ]

Somewhat later the fbcon driver takes over the video screen console. Then
USB is configured with a wifi device, an ssh daemon is started etc. for
remote login and scripting. 

I have QEMU patches for R5900 user mode emulation, that can be used for
development and debugging. I mainly use it to compile Gentoo for the
PlayStation 2.

Fredrik
