Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313CF35B06B
	for <lists+linux-mips@lfdr.de>; Sat, 10 Apr 2021 22:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbhDJUbW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Apr 2021 16:31:22 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:39374 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDJUbT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Apr 2021 16:31:19 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru F0046207521C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/6] Stop calling devm_request_irq() with invalid IRQs
 in the I2C bus drivers
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <b27b3e14-d928-f44d-8b67-2d7645009f3c@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:31:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/10/21 11:11 PM, Sergey Shtylyov wrote:

> Here are 6 patches against the 'master' branch of Martin Petersen's 'scsi.git' repo.
> The affected drivers call platform_get_irq() but largely ignore its result -- they
> blithely pass the negative error codes to devm_request_irq() which expects *unsinged*
> IRQ #s. Stop doing that by checking what exactly platform_get_irq() returns.
> 
> [1/6] i2c: cadence: add IRQ check
> [2/6] i2c: emev2: add IRQ check
> [3/6] i2c: jz4780: add IRQ check
> [4/6] i2c: mlxbf: add IRQ check
> [5/6] i2c: rcar: add IRQ check

   Forgot to mention that the whole v2 patch set grew from this R-Car patch.

> [6/6] i2c: sh7760: add IRQ check

MBR, Sergey
