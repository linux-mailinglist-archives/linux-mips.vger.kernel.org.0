Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5192DDBDC
	for <lists+linux-mips@lfdr.de>; Fri, 18 Dec 2020 00:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732054AbgLQX2S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 18:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgLQX2R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Dec 2020 18:28:17 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5C1C0617A7
        for <linux-mips@vger.kernel.org>; Thu, 17 Dec 2020 15:27:37 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kq2gJ-008RFB-PO
        for linux-mips@vger.kernel.org; Fri, 18 Dec 2020 00:27:35 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kq2gG-008REv-Ge; Fri, 18 Dec 2020 00:27:32 +0100
Subject: Re: [PATCH] Add support for Realtek RTL838x/RTL839x switch SoCs
To:     Oleksij Rempel <linux@rempel-privat.de>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215183557.646034-1-bert@biot.com>
 <fbd86bc4-5826-5b2b-5818-3ccd39a090fb@rempel-privat.de>
From:   Bert Vermeulen <bert@biot.com>
Message-ID: <a4d89688-347b-21af-ef29-a28cd480d2d9@biot.com>
Date:   Fri, 18 Dec 2020 00:27:32 +0100
MIME-Version: 1.0
In-Reply-To: <fbd86bc4-5826-5b2b-5818-3ccd39a090fb@rempel-privat.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/15/20 11:11 PM, Oleksij Rempel wrote:
> Hello Bert,
> 
> thank you for your work. Here are some comments..

Thanks for reviewing. I will send in a V2 with your comments all handled.

> I assume, after applying all needed changes, there will be no files within
> arch/mips/include/asm/mach-realtek :)

I wish! Unfortunately I need somewhere to put the early printk init call, 
and the SoC family ID checks -- as they are heavily used in various drivers.


-- 
Bert Vermeulen
bert@biot.com
