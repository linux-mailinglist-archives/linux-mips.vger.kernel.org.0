Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50BC1953BB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 10:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgC0JVW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Mar 2020 05:21:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:56504 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgC0JVW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Mar 2020 05:21:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 216EBB2C2;
        Fri, 27 Mar 2020 09:21:20 +0000 (UTC)
Date:   Fri, 27 Mar 2020 10:21:17 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     jiaxun.yang@flygoat.com, chenhc@lemote.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lixuefeng@loongson.cn, paulburton@kernel.org, ralf@linux-mips.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v3 1/2] firmware: dmi: Add macro
 SMBIOS_ENTRY_POINT_SCAN_START
Message-ID: <20200327102117.2d8fb811@endymion>
In-Reply-To: <623abcd1-7c5b-3cae-817b-fc993897b9a9@loongson.cn>
References: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
        <8ee01022-d3d1-8145-1a0b-ba77c5bb7101@loongson.cn>
        <20200326150716.47b4152f@endymion>
        <623abcd1-7c5b-3cae-817b-fc993897b9a9@loongson.cn>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 27 Mar 2020 09:21:17 +0800, Tiezhu Yang wrote:
> On 03/26/2020 10:07 PM, Jean Delvare wrote:
> > Hi Tiezhu,
> >
> > On Thu, 20 Feb 2020 10:43:56 +0800, Tiezhu Yang wrote:  
> >> Since this patch is independent and it has no any negative influence,
> >> could you apply it to your DMI tree first?  
> > I've just queued your patch for kernel 5.6. Thanks for your
> > contribution and sorry for the delay.
> >  
> 
> Hi Jean,
> 
> Thank you very much, it has been merged into
> mips-next and linux-next tree by Thomas about
> three days ago, so you can drop it in your tree.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=3da27a4eb8c214d692e024473415fe7d2e88e7d7
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3da27a4eb8c214d692e024473415fe7d2e88e7d7

OK, I removed it from my dmi tree to avoid conflicts.

-- 
Jean Delvare
SUSE L3 Support
