Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F10217823
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2020 21:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgGGTnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jul 2020 15:43:10 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49969 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgGGTnK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Jul 2020 15:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1594150990; x=1625686990;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5hAGoX9bpEnMc0yjToCRpoRR2njtiXe3KcZke6Qo8Ms=;
  b=kET3+E8lxNJUDL8JyVCXlvBy7C8qtYIoPL8UO8PRejkh/DjLCo+Wk6E9
   BU973bbJxzz8x9MR00QGpo8qMu2mlV8hfPf3C7f6x/v0HuQYEhmdVGCEd
   pv6Hz5qF7TnWTmjE/n6kr3a11lL5ZSrtEdHFiNIF1snYisfwe6xD0yLij
   hoizGWqb74qOwDo1+bD5f/O1Ttm7zWA9JQc4OrM7Jrmoj1xZ9D9TWCqIs
   7Q5DhCOgobZZtUjcz3S1T6sbla1NqNlG4BiZJxVo+jC7HJKfazworguYZ
   CnnZptkCFkrcCxPTzlIQdQeRX4isXdUhrKhLb4R1muPpTJjLiEYVrXDuJ
   Q==;
IronPort-SDR: 8qMVeD4lWzabxtQB63an5GpRkvewBkitrqlQqK98ala8t6L1qOB6unAtBuNFAroH6dqCVBiUUb
 hsTzUOwQqnErQs5yOugUtZ+HN9YGkqvxq9FSzKPTNKSmv137yrqPoEXhLg5w0ug7gxTEbESmvK
 x2mWSpOJ8KyF5T6TGmofup6bnt4isiJeBiln7WndSoeti6qY7/tSi6rNv39VGtNJObLDRgzgva
 69C56c7J5XH/79ZqrA7HKQSWbFGR349ucZkyhLWmOLTFkBzRW/CjuFJX7NfiKuBWPXmCdx7rNd
 QZ4=
X-IronPort-AV: E=Sophos;i="5.75,324,1589212800"; 
   d="scan'208";a="146174357"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 03:43:10 +0800
IronPort-SDR: /KHPlvEbCwZ92Qca2hsJrjfV6X4gJUAHEiTUFo/pxiJVDD2peENuqzWE5zOQd6mf7JWRxpGB/w
 GJ3LPaxwA2dcuZWpvCMRWdnJs61f7tCUQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:31:16 -0700
IronPort-SDR: OK2XsSW343zG0Vy2qtW/gcmYuWQFhfkg21K0U/C2moGqcEyt7EAd6L3XwbG1g9Q/kYtIa8FGsz
 0iIZm/+cIKzQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:43:09 -0700
Date:   Tue, 7 Jul 2020 20:43:06 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: Unify naming style of vendor CP0.Config6 bits
In-Reply-To: <20200622154453.GA17294@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2007072042410.31807@redsun52.ssa.fujisawa.hgst.com>
References: <1592397282-14433-1-git-send-email-chenhc@lemote.com> <20200622154453.GA17294@alpha.franken.de>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 22 Jun 2020, Thomas Bogendoerfer wrote:

> before applying I'd like to get a comment from you, if things are now
> in a good shape.

 Done now, sorry to take so long.

  Maciej
