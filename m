Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C15328CF
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 08:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFCGtr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 02:49:47 -0400
Received: from verein.lst.de ([213.95.11.211]:54912 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbfFCGtr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Jun 2019 02:49:47 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 05FD468B20; Mon,  3 Jun 2019 08:49:22 +0200 (CEST)
Date:   Mon, 3 Jun 2019 08:49:21 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/7] au1100fb: fix DMA API abuse
Message-ID: <20190603064921.GB22023@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <CGME20190430110118epcas2p24019c7551331cc6390e5b5e07b381dd9@epcas2p2.samsung.com> <20190430110032.25301-3-hch@lst.de> <7a63eeae-4ec3-c82e-c497-8adc7bcb3cea@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a63eeae-4ec3-c82e-c497-8adc7bcb3cea@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

FYI, I've merged this patch into the dma-mapping tree to make progress
with the generic uncached segment support for mips.
