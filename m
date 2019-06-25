Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E231F54E69
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 14:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfFYMJ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 08:09:59 -0400
Received: from verein.lst.de ([213.95.11.211]:34271 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfFYMJ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 08:09:59 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id DC6E068B05; Tue, 25 Jun 2019 14:09:27 +0200 (CEST)
Date:   Tue, 25 Jun 2019 14:09:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] jz4740_fb: fix DMA API abuse
Message-ID: <20190625120927.GA4205@lst.de>
References: <20190509173849.11825-1-hch@lst.de> <CGME20190509173943epcas2p27a7106894d5a235a405a94e84340b416@epcas2p2.samsung.com> <20190509173849.11825-4-hch@lst.de> <8a149d05-047b-6df1-28fc-184dae9c32df@samsung.com> <16211aea-cd48-2d68-7ba9-d81b126d81cf@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16211aea-cd48-2d68-7ba9-d81b126d81cf@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 01:32:16PM +0200, Bartlomiej Zolnierkiewicz wrote:
> I've just removed the "Switch the driver.." sentence myself from
> the patch description and applied the change, thanks!

Sorry for not getting back to you earlier and thanks for fixing this
up and applying the patch.
