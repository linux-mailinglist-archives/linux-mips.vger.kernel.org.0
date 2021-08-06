Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1643E3E2A3A
	for <lists+linux-mips@lfdr.de>; Fri,  6 Aug 2021 14:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhHFMB0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Aug 2021 08:01:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhHFMBZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Aug 2021 08:01:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28D5D604DB;
        Fri,  6 Aug 2021 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628251270;
        bh=5BhlZSX2NZg56dLWTABdzj0Dqu2NHsgabE/EzR4Ci0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OtP3lmmaiIQ7pPcNrWNozDkgsbdvzEkvb0904Qkm8yvUN4NhVbK9mwfYsFNU3t7Z3
         WRhaybOpyP6PxAkEfJ/ETLm9qP7qucoS1aF6jYyaeTGnnsGozI81+Eh5mwn/MODXgR
         WuKrgCflx+KLANkvKmggUELrEOo+ZWRS3bm3wKaLdTnfyrWgEe6mytkl5kHtlbYGoa
         2VRz0BdH1CGFXwZl7J+il6hAQIVLSYZFomfrPa+oTRSo+YGtcCY7MjECfCw8d+qON/
         Mal+sNmq9XF+QclNx14KclVxZ+w0yOBzqFHQyaaiDuQw9k5ZwzEkEpojjs+3sOpDEE
         T8rEG/IjB+2UA==
Date:   Fri, 6 Aug 2021 17:31:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        mturquette@baylibre.com, daniel.lezcano@linaro.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
Message-ID: <YQ0kgfzCFXoHKcsP@matsya>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
 <20210723022543.4095-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723022543.4095-6-jiaxun.yang@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23-07-21, 10:25, Jiaxun Yang wrote:
> So it will be avilable for generic MIPS kernel.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
