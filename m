Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D49C6D96E3
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjDFMOf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 08:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236968AbjDFMOd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 08:14:33 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3B930D4
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 05:14:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d17so39281750wrb.11
        for <linux-mips@vger.kernel.org>; Thu, 06 Apr 2023 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680783269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtN6finzlKyjOWOTDfHBV+4d8fKjhpXJy7YkWKnE6X8=;
        b=fUiy/wpfYV1ZBaAFw5mPNZBrYwyPjKEFeedgzHaJvzqrmTkzezArwN1BBgSXOgytmG
         94kW3OOcyejtN6rK2XhqUrcohm4fjqm5wGumy8xLadNiRWyg/AhKSWHTRnX4/wS0q+Vf
         3myriiFR5HW3XnPOTW7UfohFOhacsMOdZINbiTGXfNUIz8QxSZmhGGXb5GsBEu4JOmUO
         68znTs7QF4SLHjYxsjBFIUoFR+EGpwY+td+zi9BFUv3eN3KSc1rC7VtFTn7crLoKf/vn
         WSYfxxezKtjqF9I4Y40mVZplEP2CkCK5ZOPVxddvED3kSiHNjQ7LraAUHsh1u9tpiTiq
         UXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtN6finzlKyjOWOTDfHBV+4d8fKjhpXJy7YkWKnE6X8=;
        b=WvGPFcz5Ukt4UolLyENABvwGbR35wfALod8aLmHO/Ef545DrJy75nBM36J8YYm9NoA
         5SRdL5cJBsQNet3nYF/GSwv0pcSzn9auXWd1hDxLUj7NTP6dOUpD69IQZDbQUkq1BmtD
         H8p7Sl24zcREdz2Tn9thIHSd5M6hWTGQW3Sh0LXB2i7NFCQ6G4sfv1A0+/9jiTTpTq7M
         /r/tXPkJoz/Bx+0+3WhxeHzv3W5O5A9J1Puoqe+MHL2IwB/4SiMftcNDXHI5W2xIR3TP
         cBoGWVjpuP0t33l9jgwqcbYNAPk4qdGp/0mFbQGYXXVa0ZE/XeSxCgb/xqod3TXK3D+V
         2eHQ==
X-Gm-Message-State: AAQBX9cXyZfPvHtk/Jjpp/qOlB9qEP/LFbbL9bDZZMV1HRuFmxjbgWUL
        Vo39xo5DMs28z8giTqik/DOcVg==
X-Google-Smtp-Source: AKy350Zv1H53qcTrQdQmKKvpijr863TpWXekAARScTC3UByulubKjEiiO79+Ua9XQrRktPoJ23+5ww==
X-Received: by 2002:a5d:610a:0:b0:2d5:553a:93ac with SMTP id v10-20020a5d610a000000b002d5553a93acmr6985574wrt.7.1680783269444;
        Thu, 06 Apr 2023 05:14:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600001c100b002d51d10a3fasm1622971wrx.55.2023.04.06.05.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:14:29 -0700 (PDT)
Message-ID: <0917542e-e8b4-6dbb-54c4-8215b05e399a@linaro.org>
Date:   Thu, 6 Apr 2023 14:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-mips@vger.kernel.org, kernel@pengutronix.de
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/4/23 18:19, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

