Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 227E9A8ADA
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 21:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732833AbfIDQAu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 12:00:50 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:36764 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732823AbfIDQAt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 12:00:49 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994735AbfIDQAm6-rc2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 18:00:42 +0200
Date:   Wed, 4 Sep 2019 17:00:42 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Fredrik Noring <noring@nocrew.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>
Subject: Re: [PATCH 022/120] MIPS: R5900: Support 64-bit inq() and outq()
 macros in 32-bit kernels
In-Reply-To: <975d5c12-2918-80e7-3ab5-93c678e1a2e0@flygoat.com>
Message-ID: <alpine.LFD.2.21.1909041635410.2031@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <7ea8b1211bceb8193154b51ad4241e7c0b86547d.1567326213.git.noring@nocrew.org> <975d5c12-2918-80e7-3ab5-93c678e1a2e0@flygoat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 4 Sep 2019, Jiaxun Yang wrote:

> > PlayStation 2 hardware such as the Graphics Synthesizer requires 64-bit
> > register reads and writes[1], also in 32-bit kernels. Interrupts must be
> > disabled when manipulating 64-bit registers unless the kernel saves and
> > restores 64-bit registers in the interrupt and context switch handlers.
> 
> Hi Fredrik,
> 
> Why don't we just build a 64bit kernel rather than do these hacks?
> 
> Any hardware/firmware issue blocks 64bit kernel?

 One issue I recall with the R5900 is $pc is 32-bit (as if with 
CP0.Status.PX=1 on modern hardware) and is zero- rather than sign-extended 
when copied to a GPR with instructions like JALR, BLTZAL, etc.  This is 
contrary to MIPS architecture requirements and unlike other 64-bit MIPS 
processors.

 This does not cause an issue in the user mode (because USEG addresses 
have bit #31 set to 0 anyway) or with the JR and JALR instructions 
(because these ignore the upper 32 bits in the source GPR).  This however 
breaks in the kernel mode whenever the value retrieved from $pc is used 
for any kind of calculation, meaning that the kernel will have to be 
audited for such use before we can run 64-bit kernel code.

 This means it's much easier to have a 32-bit kernel running, with a small 
and simple sanitanisation change posted as 003/120, and have all the 
platform and driver infrastructure verified before this processor quirk is 
addressed.

  Maciej
