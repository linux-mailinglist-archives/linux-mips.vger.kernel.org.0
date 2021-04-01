Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7B8350EFF
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 08:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhDAG1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 02:27:48 -0400
Received: from verein.lst.de ([213.95.11.211]:38308 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhDAG1k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 02:27:40 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9934A68BEB; Thu,  1 Apr 2021 08:27:38 +0200 (CEST)
Date:   Thu, 1 Apr 2021 08:27:38 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH v2 2/4] MIPS: uaccess: Added __get/__put_kernel_nofault
Message-ID: <20210401062738.GA25514@lst.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de> <20210331115603.146159-3-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115603.146159-3-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 01:55:59PM +0200, Thomas Bogendoerfer wrote:
> Added __get/__put_kernel_nofault as preparation for removing
> get/set_fs.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
