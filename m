Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD943D683
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 00:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhJ0WYm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 18:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ0WYm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 18:24:42 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE13C061570;
        Wed, 27 Oct 2021 15:22:16 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so5766728ote.8;
        Wed, 27 Oct 2021 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9WxVcy2wshiQJIYQ7TvssmK1qx79YdAEglIn/7EOveI=;
        b=BSlOwaXjGLFoLF2naxD+OkhVvsl9PTomwdJcEtlhwNTJW9h91kvoGx2RsDN4nBnb+7
         v0X/uwoL7mc+fh9MM/sX2veCwSL70qH6jExuQ5f3twP8fxNogyXObJ/d1RUo9Xwbo0ot
         SpaOFv7/nSbGhSyzcKHMd2QwAgCD0atcKO14ketkV15eZhoiPJk1Mu4TFSMRNuS+Ibqr
         xnQEKauDte9EF77XCCh1Pofuvpl7GQrz7H3F3CpmGJ/A8dPaOzMWreTrPx8LW9KLCFvc
         Yiui2rY0z2qKqZQl2JPO+YXlqPTjIpYSRaQrL0gwwZlooCr/jCZoV8KmfkAGCJHgxUig
         a1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=9WxVcy2wshiQJIYQ7TvssmK1qx79YdAEglIn/7EOveI=;
        b=yjLO6L2zx4/8NMz3Vm0rTjcEy4wiv2flT7EbuWpZvoZcYUNNRGOm4xIZYUMT3rp2Gr
         qzQvfA3RRq4hH3QWdY82gZBc0KJYMGfvDX90EBCUC5cmeCxjC+XSMh+zg0or1HbPgExf
         PjpfGuoW4H3RJD62ek2BNzP3IrJ5TIAz4wywYexvRmg6dxuptENP9VgNQ1NnWfru9l7l
         IJvNufTNIpQM4/ztVcAFTZzs2kMZd50414B5JIYJdQG1QS3L/osvTTf8yUHcjk13+BiN
         czyyYBszNkkkMxPd6hIH0FHeu9yBtM/h0SMF0SEbCquTCHMW2YByvvhW6rxHB5/pn1H3
         LY8Q==
X-Gm-Message-State: AOAM533RpaICZb3lBaLqmmDzp9opQO9qMJoQTD26PEgZebF5XMYv3UCq
        cxvqhPpqbhVyMhoCJpt+UTY=
X-Google-Smtp-Source: ABdhPJxprtTV2Lpl+aOIJ+Y8uqMJk1w1xuezGNSoKrWHUvrlkz2E/k0LkjUSMUtPVU5QTUVt9LreVA==
X-Received: by 2002:a9d:ba5:: with SMTP id 34mr407059oth.108.1635373335526;
        Wed, 27 Oct 2021 15:22:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd39sm582689oib.2.2021.10.27.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 15:22:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Oct 2021 15:22:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 3/3] watchdog: bcm63xx_wdt: support BCM4908
Message-ID: <20211027222213.GB342815@roeck-us.net>
References: <20211027215531.9996-1-zajec5@gmail.com>
 <20211027215531.9996-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027215531.9996-3-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 27, 2021 at 11:55:31PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> So far bcm63xx_wdt included support for Broadcom's watchdog block of old
> MIPS devices only. It was also a fully platform (non-DT) driver.
> 
> The same block was recently found on BCM4908 with just a slightly
> different registers layout. Extend this driver to support OF and add
> support for per-chipset registers offsets.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Please convert the driver to use the watchdog subsystem first.
Also, when doing so, please explain why you don't use the bcm7038
driver instead, since it serves the same hardware interface and
already supports the watchdog core.

Guenter
