Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA95A720F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 19:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfICR7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 13:59:55 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:55852 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICR7z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 13:59:55 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992810AbfICR7xIXwf6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 19:59:53 +0200
Date:   Tue, 3 Sep 2019 18:59:53 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fredrik Noring <noring@nocrew.org>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
In-Reply-To: <20190903174212.GA22657@sx9>
Message-ID: <alpine.LFD.2.21.1909031857150.2031@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org> <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com> <20190902144007.GA2479@sx9> <2ac424e5-017b-5892-ef38-fe25ec5f38d1@flygoat.com>
 <20190903174212.GA22657@sx9>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 3 Sep 2019, Fredrik Noring wrote:

> The video screen is used for the earliest stages, even before the kernel
> is decompressed in arch/mips/boot/compressed/decompress.c. I have a simple
> patch that sets up the Graphics Synthesizer and uses DMA to render a
> trivial frame buffer console, displaying
> 
> 	zimage at:     00803BE0 00BDDE8C
> 	Uncompressing Linux at load address 80010000
> 	Now, booting the kernel...
> 
> and so on as a video image. This is functionally equivalent to the serial
> port drivers for prom_putchar() that other MIPS platforms have, and
> essential to debug early boot and kexec.
> 
> [ I assume this code will not be accepted, since the approach is rather
> nontraditional, which is why I didn't include it in the patch set. ]

 Hmm, why do you think this would be unacceptable?  Do you expect your 
code to cause unjustified maintenance burden once integrated?

  Maciej
