Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7971CA6D83
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 18:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfICQGb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 12:06:31 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:37540 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfICQGb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 12:06:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 168D53F59B;
        Tue,  3 Sep 2019 18:06:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id R2QSjieuHuo7; Tue,  3 Sep 2019 18:06:29 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 200113F4A9;
        Tue,  3 Sep 2019 18:06:28 +0200 (CEST)
Date:   Tue, 3 Sep 2019 18:06:28 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 120/120] MIPS: Fix name of BOOT_MEM_ROM_DATA
Message-ID: <20190903160628.GB3595@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
 <d88ab711-b8b6-a04f-6f19-82ecbb758398@flygoat.com>
 <20190902152626.GC2479@sx9>
 <01a6d6e1-2c14-c3fd-8c15-ac54726e55d3@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01a6d6e1-2c14-c3fd-8c15-ac54726e55d3@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> Then it's not *memory* right?'
>
> And It should not be managed by boot_mem_map (Or memblock after 
> boot_mem_map being dropped).

ROM0 corresponds to IC503 (BOOT) and ROM1 to IC506 (DVD) in the SCPH-30000
series edition 6 service manual. Both 4 MiB 44 pin chips. IC506 is faintly
marked with SCEI at the bottom of this image of the A side of the mainboard:

https://commons.wikimedia.org/wiki/File:PS2-SCPH-30001-Motherboard.jpg

IC503 is on the B side. What would they be if not read-only memory?

Sony made numerous revisions of their mainboards, so earlier and later
designs were different.

> Add these stuff to resource system by platform code is better than 
> hijack memory map of all other machines.

Sorry, I was unclear. The other ones are platform resources, although
incomplete.

Fredrik
