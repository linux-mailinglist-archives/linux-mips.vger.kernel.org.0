Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FE8139475
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 16:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgAMPM5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 10:12:57 -0500
Received: from verein.lst.de ([213.95.11.211]:41728 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbgAMPM5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 10:12:57 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id E082968B20; Mon, 13 Jan 2020 16:12:53 +0100 (CET)
Date:   Mon, 13 Jan 2020 16:12:53 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-mips@vger.kernel.org,
        chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: Define pgprot_dmacoherent according to
 coherentio status
Message-ID: <20200113151253.GA10064@lst.de>
References: <20200113140705.74605-1-jiaxun.yang@flygoat.com> <20200113145820.GA9817@lst.de> <6A037EB9-B5FE-462F-A6EA-8FD874432E75@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6A037EB9-B5FE-462F-A6EA-8FD874432E75@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 13, 2020 at 11:11:58PM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年1月13日 GMT+08:00 下午10:58:20, Christoph Hellwig <hch@lst.de> 写到:
> >On Mon, Jan 13, 2020 at 10:07:04PM +0800, Jiaxun Yang wrote:
> >> For MIPS chips that support coherentio DMA, it's always safe
> >> to make DMA requests cached.
> >
> >For DMA coherent devices pgprot_dmacoherent isn't even used, so this
> >doesn't make sense.
> 
> Hi,
> 
> I'm supposed to use it later in drm/ttm
>  ttm_bo_util to overwrite pgprot for TTM_PL_SYSTEM.
> And I wish this pgropt can always represent dmacoherent pgropt.
> Would it be fine?

No code outside the core DMA code has any business using
pgprot_dmacoherent.

