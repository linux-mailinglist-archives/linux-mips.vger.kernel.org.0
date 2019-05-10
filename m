Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7570119EDA
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 16:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfEJOQ6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 10 May 2019 10:16:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:53108 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727247AbfEJOQ6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 May 2019 10:16:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2E487AF44;
        Fri, 10 May 2019 14:16:57 +0000 (UTC)
Date:   Fri, 10 May 2019 16:16:56 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] MIPS: SGI-IP27: move IP27 specific code out of
 pci-ip27.c into new file
Message-Id: <20190510161656.79252774b48c0d6d57df98cc@suse.de>
In-Reply-To: <20190509235444.3bvfwkl7y3cjc2yv@pburton-laptop>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
        <20190507210917.4691-2-tbogendoerfer@suse.de>
        <20190508061815.GB19227@infradead.org>
        <20190508095239.d055251e838a9e4fd2eff522@suse.de>
        <20190509235444.3bvfwkl7y3cjc2yv@pburton-laptop>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 May 2019 23:54:46 +0000
Paul Burton <paul.burton@mips.com> wrote:

> Hi Thomas,
> 
> On Wed, May 08, 2019 at 09:52:39AM +0200, Thomas Bogendoerfer wrote:
> > On Tue, 7 May 2019 23:18:15 -0700
> > Christoph Hellwig <hch@infradead.org> wrote:
> > 
> > > On Tue, May 07, 2019 at 11:09:13PM +0200, Thomas Bogendoerfer wrote:
> > > > Code in pci-ip27.c will be moved to drivers/pci/controller therefore
> > > > platform specific needs to be extracted and put to the right place.
> > > 
> > > I thogh the drivers/pci/controller was nixed by Lorenzo?
> > 
> > yes, I missed this. Paul should I respin ?
> 
> No, I've basically dropped this patch whilst applying patches 2 & 3.
> Could you check that mips-next looks good? I checked that ip27_defconfig
> builds but don't have any way to run it.

tested on the dual module O200 and it runs as expected. Thank you

Thomas.


-- 
SUSE Linux GmbH
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
