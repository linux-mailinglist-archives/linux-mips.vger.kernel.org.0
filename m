Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 393D245140
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2019 03:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbfFNBkg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 13 Jun 2019 21:40:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:29056 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbfFNBkg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 13 Jun 2019 21:40:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 18:40:36 -0700
X-ExtLoop1: 1
Received: from lftan-mobl.gar.corp.intel.com (HELO ubuntu) ([10.226.248.78])
  by fmsmga007.fm.intel.com with SMTP; 13 Jun 2019 18:40:34 -0700
Received: by ubuntu (sSMTP sendmail emulation); Fri, 14 Jun 2019 09:40:34 +0800
Message-ID: <1560476434.21652.1.camel@intel.com>
Subject: Re: switch nios2 and microblaze to use the generic uncached
 segement support
From:   Ley Foon Tan <ley.foon.tan@intel.com>
To:     Christoph Hellwig <hch@lst.de>, Michal Simek <monstr@monstr.eu>
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 14 Jun 2019 09:40:34 +0800
In-Reply-To: <20190603065324.9724-1-hch@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2019-06-03 at 08:53 +0200, Christoph Hellwig wrote:
> Hi all,
> 
> can you take a look at this series?  It switches niops2 and
> microblaze to
> use the generic dma layer support for uncached segements.
> 
> The dma mapping for-next git tree that includes the support is
> available
> here:
> 
>     git://git.infradead.org/users/hch/dma-mapping.git for-next
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/
> heads/for-next
> 

Hi Christoph

Can this patch in http://git.infradead.org/users/hch/dma-mapping.git/sh
ortlog/refs/heads/for-next

[PATCH 1/2] nios2: use the generic uncached segment support in dma-
direct

Regards
Ley Foon
