Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A6A139415
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 15:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgAMO6X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 09:58:23 -0500
Received: from verein.lst.de ([213.95.11.211]:41669 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728843AbgAMO6X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 09:58:23 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id ED5DB68B20; Mon, 13 Jan 2020 15:58:20 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:58:20 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, linux-kernel@vger.kernel.org, hch@lst.de
Subject: Re: [PATCH 1/2] MIPS: Define pgprot_dmacoherent according to
 coherentio status
Message-ID: <20200113145820.GA9817@lst.de>
References: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 13, 2020 at 10:07:04PM +0800, Jiaxun Yang wrote:
> For MIPS chips that support coherentio DMA, it's always safe
> to make DMA requests cached.

For DMA coherent devices pgprot_dmacoherent isn't even used, so this
doesn't make sense.
