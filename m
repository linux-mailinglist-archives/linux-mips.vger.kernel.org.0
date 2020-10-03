Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE692826B7
	for <lists+linux-mips@lfdr.de>; Sat,  3 Oct 2020 23:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgJCVHL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Oct 2020 17:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgJCVHL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Oct 2020 17:07:11 -0400
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 919C3C0613D0
        for <linux-mips@vger.kernel.org>; Sat,  3 Oct 2020 14:07:11 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id DD9572BE086;
        Sat,  3 Oct 2020 22:07:08 +0100 (BST)
Date:   Sat, 3 Oct 2020 22:07:05 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Baoquan He <bhe@redhat.com>
cc:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old
 memories
In-Reply-To: <20200923030847.GM25604@MiWiFi-R3L-srv>
Message-ID: <alpine.LFD.2.21.2010032200470.333514@eddie.linux-mips.org>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com> <20200923024548.GL25604@MiWiFi-R3L-srv> <CAAhV-H66O77hK7kB8cCcM6XUOc-TFEg_TJG+GrCSEdD89Qxb7g@mail.gmail.com> <20200923030847.GM25604@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 23 Sep 2020, Baoquan He wrote:

> > > And we don't have mem=X@Y, only mem=nn[KMG].
> > The relocatable kernel of MIPS is still unusable now, so MIPS should
> > use mem=X@Y, and the crash kernel is always different from normal
> > kernel.
> 
> Interesting. Seems MIPS does support mem=X@Y, even though the document
> of 'mem=' says it's used to specify amount of memory, but not memory
> region. Anyway, leave this to mips reviewers, thanks for replying.
> 
> ~~~~~~~~~~~~~~~~~~~
>         mem=nn[KMG]     [KNL,BOOT] Force usage of a specific amount of memory
>                         Amount of memory to be used in cases as follows:

 Yep, I implemented it for the DECstation back in 2000:

commit 97b7ae4257ef7ba8ed9b7944a4f56a49af3e8abb
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Mon Dec 11 16:41:05 2000 +0000

    Memmap fixes from Maciej.

(from the LMO repo) in line with the x86 syntax.  I don't know why it 
hasn't ever been documented in "Kernel Parameters" (for any port), but I'm 
fairly sure it has been somewhere.

 FWIW,

  Maciej
