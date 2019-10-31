Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70CC2EB8E6
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2019 22:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbfJaVXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Oct 2019 17:23:20 -0400
Received: from verein.lst.de ([213.95.11.211]:53070 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbfJaVXU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Oct 2019 17:23:20 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 18C5368BE1; Thu, 31 Oct 2019 22:23:18 +0100 (CET)
Date:   Thu, 31 Oct 2019 22:23:17 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     David Miller <davem@davemloft.net>
Cc:     hch@lst.de, tbogendoerfer@suse.de, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ioc3_eth DMA API fixes
Message-ID: <20191031212317.GA12656@lst.de>
References: <20191030211233.30157-1-hch@lst.de> <20191031.141334.860083978503478801.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031.141334.860083978503478801.davem@davemloft.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 31, 2019 at 02:13:34PM -0700, David Miller wrote:
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 30 Oct 2019 14:12:29 -0700
> 
> > Hi Dave and Thomas,
> > 
> > please take a look at this series which fixes DMA API usage in the ioc3
> > ethernet driver.  At least the first one is a nasty abuse of internal
> > APIs introduced in 5.4-rc which I'd prefer to be fixed before 5.4 final.
> 
> Please add the alignment code for 16K or whatever they need and I'll apply
> this series.

I'll let Thomas add this as this series doesn't change anything in that
regard.
