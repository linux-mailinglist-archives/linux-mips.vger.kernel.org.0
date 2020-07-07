Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA61A217830
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2020 21:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbgGGTpo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jul 2020 15:45:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:53820 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbgGGTpn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Jul 2020 15:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1594151165; x=1625687165;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rYdMBPFrRbVbk8DFcQNubWpbbG2Xb3oRsw/dpkB/QeY=;
  b=iZm8ucIwss395xYeuy6/lyIrXg/lxl1aIE5T381krOpDcgWMl3grSISR
   mrK4r8gy0I00VkRsnzbxxmAPUEMc1R6YLP2wZroapQofD8IpYEA9mKXBx
   oueGgieWW4x8mD7y+oQwQaq3wZMQeoGTUINhyO22+my56JJjxG4SP9zzM
   0mWveAUEdJXsqP4jWs9hWbTyFeL6JbL4w5mzNeApk0D/WuF+kJyu6aG9j
   8gsnyb8e5OtI58FrupM9Rit/yQsIEC8kdRBJnTxE04mEVwmcBndF7QoWX
   d1v3udBqXVZQNyaXtp7ckgwk7L4ZK9DP/H0ITIX+u99aN6QRlCAm2+9F3
   A==;
IronPort-SDR: btQDLBa3Z1VKjRGWwi659ExoF2P0emFH899iYeQnMViGMOHIDHsdHiDetDykHUa3eThgOOHg3x
 ex/TEPcMztWkaWiRoPs3mQunupN/GPH6WgKJLXWqC5hXo1YmmUfuIP3UxZvQ/SGl3AOs0oXh5B
 aPgLqNudufRl0DSuyJ3FN8r7zDiG1+ztjK/576iJ0mmeBZEDQj2dnDrFqnkvSHBzlRCN3qqLhX
 o5OKeG53Z9+ZuQCdd+kQZhvtGhyHR+x+4WMWYrtoLIYeixNZhx9UhI09YbtC2/J8XIQZyUDHXv
 JiE=
X-IronPort-AV: E=Sophos;i="5.75,324,1589212800"; 
   d="scan'208";a="244884702"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 03:46:05 +0800
IronPort-SDR: nSKFKD1wIQuP7Y1kcmCly4O9Vqh8RONK/bvL3DW8BFAiw6pb0y/ftDYK9eaXpjZCpblbjU9Ea8
 cwv5oboEtpM1DCNFfrhwOzsXb7+HqlISI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:34:22 -0700
IronPort-SDR: y0nVZrUYU/RZaOg80bWjddoYfs2s76PYymRZwFgUvzefJHjOwJCL/zV/TdKh9Mp88c3v2Rhp/u
 e6i0JrmsTDhw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:45:42 -0700
Date:   Tue, 7 Jul 2020 20:45:38 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
In-Reply-To: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 7 Jul 2020, Tiezhu Yang wrote:

> In the MIPS architecture, we should clear the security-relevant
> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
> file arch/mips/include/asm/elf.h.
> 
> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
> mmap to make memory executable that is not safe, because this
> condition allows an attacker to simply jump to and execute bytes
> that are considered to be just data [1].

 Why isn't the arrangement made with `mips_elf_read_implies_exec' 
sufficient?

  Maciej
