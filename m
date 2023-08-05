Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293E17712DA
	for <lists+linux-mips@lfdr.de>; Sun,  6 Aug 2023 00:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjHEWUg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Aug 2023 18:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHEWUf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Aug 2023 18:20:35 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CC09268A
        for <linux-mips@vger.kernel.org>; Sat,  5 Aug 2023 15:20:33 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qSPdQ-0002gx-00; Sun, 06 Aug 2023 00:20:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5A25BC01A8; Sun,  6 Aug 2023 00:20:22 +0200 (CEST)
Date:   Sun, 6 Aug 2023 00:20:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     debian-mips <debian-mips@lists.debian.org>, dsa@debian.org
Cc:     linux-mips@vger.kernel.org
Subject: Re: Getting Bullseye/Bookworm kernel running on Loongson 3A boards
Message-ID: <ZM7LJvwqR4lLbiR5@alpha.franken.de>
References: <ZL1SZw8VrAf3qdxy@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZL1SZw8VrAf3qdxy@aurel32.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 23, 2023 at 06:16:39PM +0200, Aurelien Jarno wrote:
> Dear MIPS porters,
> 
> DSA would like to upgrade the remaining mips*el buildds to bullseye (and
> later to bookworm), however we have trouble running the Bullseye or
> Bookworm kernel on the LS3A-RS780-1w ones.
> 
> Both Bullseye and Bookworm kernels boot fine up to the userland, but the
> network card does not work. It *seems* to an interrupt issue as the
> corresponding counter in /proc/interrupts does not change, and in
> addition the kernel logs show the following warnings:
> 
> [    5.077846] pcieport 0000:00:02.0: of_irq_parse_pci: failed with rc=-22
> [    5.084744] pcieport 0000:00:03.0: of_irq_parse_pci: failed with rc=-22
> [    5.170772] ahci 0000:00:11.0: of_irq_parse_pci: failed with rc=-22
> [    7.376554] pci 0000:00:07.0: of_irq_parse_pci: failed with rc=-22
> [    7.444769] ata_generic 0000:00:14.1: of_irq_parse_pci: failed with rc=-22
> [    7.495993] ehci-pci 0000:00:12.2: of_irq_parse_pci: failed with rc=-22
> [    7.624868] ehci-pci 0000:00:13.2: of_irq_parse_pci: failed with rc=-22
> [    7.753230] ohci-pci 0000:00:12.0: of_irq_parse_pci: failed with rc=-22
> [    7.886362] ohci-pci 0000:00:12.1: of_irq_parse_pci: failed with rc=-22
> [    8.018045] ohci-pci 0000:00:13.0: of_irq_parse_pci: failed with rc=-22
> [    8.150168] ohci-pci 0000:00:13.1: of_irq_parse_pci: failed with rc=-22
> [    8.294391] ohci-pci 0000:00:14.5: of_irq_parse_pci: failed with rc=-22
> [   18.398222] snd_hda_intel 0000:00:14.2: of_irq_parse_pci: failed with rc=-22
> [   18.547932] pci 0000:00:01.0: of_irq_parse_pci: failed with rc=-22
> 
> Any idea how to solve this issue? I have attached a full 6.1 kernel boot
> log for reference.

asking on linux-mips@vger.kernel.org might get more feedback on the issue...
From the quick look at kernel code and device tree of the board IMHO
the DTS is missing interrupt mapping entries for the PCI bus.

Could someone from Loongson have a look at the issue ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
