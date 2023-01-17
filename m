Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C8B670C39
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jan 2023 23:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjAQW4f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Jan 2023 17:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjAQWz4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Jan 2023 17:55:56 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885B659554;
        Tue, 17 Jan 2023 13:42:18 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1673991697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pjnVo30EwkdZMiQXoApdgvzG4xzAT8a665VwNTtK+J4=;
        b=2I2N0NTW1TsDU1KAv/gGB973pE2Syyjwx4b6WZ9UdixYpDTGvHDxpAZ3GRimudNUiV3xEn
        MjxPsn1G26qGpA39VtoxVzMQfJ3Q3pX49mLleMmCXi+9+HuvO1CmqD4jDMFKclDsu5oLg6
        xd4NfdcR8L//4YnvVa3IeqUBlYoh84afxLuDpQRrP6lXlW4zPSQCCYFXqORuOFmswRQm24
        MwBGEbM2IIOzP7COKWxqebnOJZx8GyccxaaSG8OSeBEvLLk4DHXYI52gQjOTN3LBDfBF10
        NqrAytCobgV8e387ITz4mB7tnlgeFrJK8Ru1VYsOSrsOc4/32NtugTYSVzBakg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1673991697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pjnVo30EwkdZMiQXoApdgvzG4xzAT8a665VwNTtK+J4=;
        b=beUKnEpt1WUsXSBhCWU0P+wMataT5eQFR+dj1V+D8rZcQ+YdMjej7Y5BHWdoOWpBDgsnKC
        2cdJd1sU4h8IuTCQ==
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     x86@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v4 11/19] x86/ioapic: Use irq_domain_create_hierarchy()
In-Reply-To: <20230116135044.14998-12-johan+linaro@kernel.org>
References: <20230116135044.14998-1-johan+linaro@kernel.org>
 <20230116135044.14998-12-johan+linaro@kernel.org>
Date:   Tue, 17 Jan 2023 22:41:36 +0100
Message-ID: <87pmbckfe7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 16 2023 at 14:50, Johan Hovold wrote:
>  
> -	ip->irqdomain = irq_domain_create_linear(fn, hwirqs, cfg->ops,
> -						 (void *)(long)ioapic);
> -
> +	ip->irqdomain = irq_domain_create_hierarchy(parent, 0, hwirqs, fn,
> +						    cfg->ops,
> +						    (void *)(long)ioapic);

The 80 character limit has been lifted quite some time ago. Please use
the 100 which are now the norm.

Thanks,

        tglx
