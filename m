Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E0734F010
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhC3Rst (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:48:49 -0400
Received: from verein.lst.de ([213.95.11.211]:59996 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhC3Rsh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:48:37 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1F87368B05; Tue, 30 Mar 2021 19:48:35 +0200 (CEST)
Date:   Tue, 30 Mar 2021 19:48:35 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH 1/3] MIPS: uaccess: Added __get/__put_kernel_nofault
Message-ID: <20210330174835.GA15145@lst.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de> <20210330172702.146909-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330172702.146909-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 07:26:58PM +0200, Thomas Bogendoerfer wrote:
> Added __get/__put_kernel_nofault as preparation for removing
> get/set_fs.

For !CONFIG_EVA __get_user_common is simply defined to
__get_kernel_common, which probably does the wrong thing here
as it would allow access to user space addresses, won't it?
