Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC21546C0B6
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 17:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbhLGQdD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 11:33:03 -0500
Received: from elvis.franken.de ([193.175.24.41]:35240 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhLGQdD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Dec 2021 11:33:03 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mudLO-0003YB-01
        for linux-mips@vger.kernel.org; Tue, 07 Dec 2021 17:29:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 087AAC4DFD; Tue,  7 Dec 2021 17:29:20 +0100 (CET)
Date:   Tue, 7 Dec 2021 17:29:19 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: Loongson3 PCI/EHCI
Message-ID: <20211207162919.GB19327@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I'm getting lots of

[    2.940587] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.946478] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.952374] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.958270] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.964166] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.970062] pci 0000:00:04.1: EHCI: unrecognized capability ff

while booting on a Loongson-3A R4 (Loongson-3A4000) @ 1800MHz system.
What I'm missing ? 

I'm also seeing

[    1.222546] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 m
ay corrupt adjacent RW1C bits
[    1.232314] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 m
ay corrupt adjacent RW1C bits

which look suspicous...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
