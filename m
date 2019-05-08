Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D64B817137
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 08:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbfEHGSS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 May 2019 02:18:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbfEHGSR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 May 2019 02:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VIAWZU6cVFHfjuwthBq/3MQaVv2Psv1M/KiH+oFGKL8=; b=R7NnV+339SGEMtwX3dywO7BGA
        UdYoVg6pQfiHAF9dTajljsHLLGu9YCBTXUP7E3itA6GS7CDnkN3wRwLElRUSykzJXaTw9IAaRs77O
        RRp23dTSfhlomJ/0D0TO958wBqLP2NnTu7CfoMzh21SUH/Ui56tGtcvD5HMjhUPXzKmeKDmpbPhOB
        pgttpOQ+30KP28idBfFggAAz6Q9xLeeo/icv9qmc4f3EefoTE3bGoc82vkwke0IW3/HXGdJxb3Tp4
        Q34SB95M4cVUGCKStxwJkhdaKi0FBhXbz2O3OOsqVEMBMTdC2i4F6qbr3hrtS/bOMbrz5YpAt0atA
        bsFLbM4Kg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOFuB-0000hS-HK; Wed, 08 May 2019 06:18:15 +0000
Date:   Tue, 7 May 2019 23:18:15 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] MIPS: SGI-IP27: move IP27 specific code out of
 pci-ip27.c into new file
Message-ID: <20190508061815.GB19227@infradead.org>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
 <20190507210917.4691-2-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507210917.4691-2-tbogendoerfer@suse.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 07, 2019 at 11:09:13PM +0200, Thomas Bogendoerfer wrote:
> Code in pci-ip27.c will be moved to drivers/pci/controller therefore
> platform specific needs to be extracted and put to the right place.

I thogh the drivers/pci/controller was nixed by Lorenzo?
