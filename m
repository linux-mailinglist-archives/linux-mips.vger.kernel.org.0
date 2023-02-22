Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A52569F4C1
	for <lists+linux-mips@lfdr.de>; Wed, 22 Feb 2023 13:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjBVMkJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Feb 2023 07:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjBVMkI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Feb 2023 07:40:08 -0500
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Feb 2023 04:40:08 PST
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1D828854
        for <linux-mips@vger.kernel.org>; Wed, 22 Feb 2023 04:40:08 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id ff9e884c-b2aa-11ed-bd9b-005056bd6ce9;
        Wed, 22 Feb 2023 14:18:22 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Wed, 22 Feb 2023 14:18:22 +0200
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/4] gpio: loongson1: Introduce ls1x_gpio_chip struct
Message-ID: <Y/YIDobQW8W3QAAh@surfacebook>
References: <20230222111213.2241633-1-keguang.zhang@gmail.com>
 <20230222111213.2241633-3-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222111213.2241633-3-keguang.zhang@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wed, Feb 22, 2023 at 07:12:11PM +0800, Keguang Zhang kirjoitti:
> Introduce and allocate ls1x_gpio_chip struct containing
> gpio_chip and reg_base to avoid global gpio_reg_base.
> 
> Use readl() & writel() instead of __raw_readl() & __raw_writel().

Please, split this to two pathes.

-- 
With Best Regards,
Andy Shevchenko


