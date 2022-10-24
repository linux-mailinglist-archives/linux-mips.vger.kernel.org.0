Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171196099C9
	for <lists+linux-mips@lfdr.de>; Mon, 24 Oct 2022 07:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJXF1M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Oct 2022 01:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiJXF1L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Oct 2022 01:27:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CAC7AB1D
        for <linux-mips@vger.kernel.org>; Sun, 23 Oct 2022 22:27:09 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z14so851239wrn.7
        for <linux-mips@vger.kernel.org>; Sun, 23 Oct 2022 22:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5Oed4FLXZSHIXrhxz7E5m4+ZCPArxpCCi/TgMyIPwo=;
        b=QRYyx+qb2r46G5UaaAn13RjXzEyBlk3VtKG/cfiEgxjyPM5J5SPoEYqPIE7eO8vWTi
         tSZoA5AYyjTD1sknUYSCDg2nP8I/3M5CGf6qFJM4imJZqQVYYZpeBqvvTYXzrwqq1fUI
         eTbO8Fipp6N/HopSd3aZyhXXZkuaerpSdmzta0w8h+1s9iNg8e+VvGXg9LTv40GdKojC
         qGZhfGwxqrf6hTprlMOZ2WOX7juKtnLP2XUhzwpVfL2eO7uSj4lChMgn5JlPa/7RLMxG
         54vEvKr7twK7v8qZ/B9yhL0NPwX2H3S1G4Z8+i/stlI9jDQe01O6fck1C3i3VbAy9FPg
         zFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5Oed4FLXZSHIXrhxz7E5m4+ZCPArxpCCi/TgMyIPwo=;
        b=jPeWTH5Wh/keU68pHUgE9Z2rEa5vJDWuoYqcbY9R9u4bQ+RPZ+g5+ByxZzAsOccVgt
         4wQw2tDCDBrALayBywnxUuDVCO9X/La1w7Kn3xujaFo363gDAVAqJnJrvlXYQlfrZisx
         VLPLAOKd3oLOnuwqsEQZOUnIzjnRC1BPBwJBXjzZ3jYcicO8Swy8JxYI8hcM4wXFdX0W
         691briHIwy8LFmyixVM49Tdu1Q0eScefiFzNN8KV35bqmKE3dlFGqNXvHxYw0euHPvzO
         WJS1L0MEhyV1yEUVPmSjR72GDbMNbPRw0q+EMfPNy5JhcqAYiTIYXp46LzcScrn/x1Es
         Jcuw==
X-Gm-Message-State: ACrzQf3M61aHlMFw50Dw9ZVXZFGZQt+P9Pfid4QElrhWwPwEHCraDjet
        iVU3JtC0ObnsjX+CXGWZjgLsbg==
X-Google-Smtp-Source: AMsMyM4KljTG8mMrDvY9fJihFWxdpLDCnX/Z0O4o+TtWrzj/KPbWefswclqhtu5vKtVXacd8QYv1yQ==
X-Received: by 2002:a05:6000:1a41:b0:22e:3667:d306 with SMTP id t1-20020a0560001a4100b0022e3667d306mr19786350wry.21.1666589228553;
        Sun, 23 Oct 2022 22:27:08 -0700 (PDT)
Received: from [10.50.0.10] (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
        by smtp.gmail.com with ESMTPSA id i9-20020a1c5409000000b003b4868eb71bsm6995337wmb.25.2022.10.23.22.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:27:08 -0700 (PDT)
Message-ID: <a962a5c6-50f1-55e5-c865-47a417ea22b6@linaro.org>
Date:   Mon, 24 Oct 2022 07:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] drivers/irqchip: fix repeated words in comments
Content-Language: en-US
To:     wangjianli <wangjianli@cdjrlc.com>, tsbogend@alpha.franken.de,
        fancer.lancer@gmail.com, tglx@linutronix.de, maz@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221022054655.36496-1-wangjianli@cdjrlc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022054655.36496-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/10/22 07:46, wangjianli wrote:
> Delete the redundant word 'the'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>   drivers/irqchip/irq-mips-gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

