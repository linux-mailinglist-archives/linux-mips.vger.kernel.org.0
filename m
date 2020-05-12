Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5B21CFCE5
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 20:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgELSLg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 14:11:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730610AbgELSLf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 May 2020 14:11:35 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CD3320714;
        Tue, 12 May 2020 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589307095;
        bh=XARoFY9WxK72wuZFMvw6XUDyzQsVu7skgmG8JLuPrDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ABx1w8BQfI7mlGTXMp7ByXxwCF5BmeKPFCsg0lJL1jgy9pNes/oYJ644BRdpPlWos
         PgQ2avhlX+yK1/H+HUfW3xfojAHyNNnEZ/SBqR14zBGVH2o4jbJw+WdTO/KTgcIWv6
         jU2JI2UpHD4Rpsg5gsCNHJod1mqCwqCI3f/sT1vo=
Date:   Tue, 12 May 2020 13:16:09 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Replace zero-length array with flexible-array
Message-ID: <20200512181609.GK4897@embeddedor>
References: <20200507190052.GA15325@embeddedor>
 <20200508130249.GC14297@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508130249.GC14297@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 08, 2020 at 03:02:49PM +0200, Thomas Bogendoerfer wrote:
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  arch/mips/kernel/signal.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> applied to mips-next.
> 

Thanks, Thomas.

--
Gustavo
