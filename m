Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A55343469
	for <lists+linux-mips@lfdr.de>; Sun, 21 Mar 2021 20:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhCUT4N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Mar 2021 15:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhCUTzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Mar 2021 15:55:38 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E1D9C061574;
        Sun, 21 Mar 2021 12:55:38 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 7E8D492009D; Sun, 21 Mar 2021 20:55:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 78DF392009B;
        Sun, 21 Mar 2021 20:55:37 +0100 (CET)
Date:   Sun, 21 Mar 2021 20:55:37 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH 0/2] MIPS: SiByte: Update SWARM defconfig for PATA support
Message-ID: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

 In the course of looking into Christoph's recent proposal to drop legacy 
IDE drivers I have noticed that SiByte SWARM's defconfig does not enable 
the pata_platform driver for the onboard PATA interface.  I think default 
configuration ought to enable all the supported onboard devices unless 
there are specific reasons so as not to, and the PATA interface is one of 
the boot devices supported by the CFE firmware, so I think even more then 
that it should be included by default.

 Change split into two because the defconfig has become stale since the 
last update, so 1/2 first regenerates it, and then 2/2 applies the actual 
modification.

 Sadly I'm currently away from my SWARM board for the foreseeable future 
and I have no remote access to it either, but this is supposed not to need 
run-time verification.  Build-tested only then.

 Please apply.

  Maciej
