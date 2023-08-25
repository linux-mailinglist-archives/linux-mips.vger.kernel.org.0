Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7557887BE
	for <lists+linux-mips@lfdr.de>; Fri, 25 Aug 2023 14:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239655AbjHYMpz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Aug 2023 08:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244729AbjHYMpq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Aug 2023 08:45:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF807D3
        for <linux-mips@vger.kernel.org>; Fri, 25 Aug 2023 05:45:44 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so1270252a12.1
        for <linux-mips@vger.kernel.org>; Fri, 25 Aug 2023 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692967543; x=1693572343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQ0SgZiq5KFAr2TbSxDALER8JptMDZobii3MJo2oJy8=;
        b=SKCF9Ty+RQwW9lmD5QtXXQ+UBg4Jvo4XjvR6LuN8lKF0rjFVf/V50BmvVY7S6UzAkY
         slegOaEcQslnM0MWFeB5u1iSqYoPQ97qEGSXG9VnGQEfjEG7Tn3ELd+Vty5CItUQjwQx
         9Vmh/cLor6XLqX1JnhsI14FJ7ksIUkJC9cq9bqYX59Id9FWcVSLH9Bt+Fi5k3O6PMjeu
         VOo+J78M+aDBZ7MPtZNKrb4eE8Vmqi4r3AW87UyhDUx79mAKoPuNVgngGCUM9FYG1Wgn
         /Mdsr/oNfbt5jkRseczomdsE5/AZeInAE83fv5KNXXW1dsGfkuuN7nWYNRBiAaKJOJVv
         sWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692967543; x=1693572343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ0SgZiq5KFAr2TbSxDALER8JptMDZobii3MJo2oJy8=;
        b=k7D5tANC+pXtAHFCmNu/68lktgIzY+PU67ABCRwxqwo1eBGO4hIZU0p98gOccmS1Fy
         7wFJBVzcCwtoDRtsqzj3frlffXtB2Cw6EISDxIPnYXV2/FH7U/nlpDi1qLpSSupA6KQQ
         eWXEHOC5FnK+gbKW0Gi8xJNGJUQ8iUmip/ev/m99LN+6lO8JJYso3YWeUC3Hp2U+AwS8
         Wfwn/MvF615imljJkKkcSxac6GieHU/hSTg3vkPpiD/XDAL7VpeWxq6Pk6nHoEKzt/IF
         xrVjAeTlXZxl9JKPG9/XRMgNellvcSRQheEgvgJJJ24vx0sP98xSte1wYKZr2IJEuu+E
         eE+g==
X-Gm-Message-State: AOJu0Yyw/PXA07Ow+ttLkpl6X2aLAXhxmJioPea/F23ilfzI/FPuKosd
        pxfmUsnmSGbXnqooKDSEP1awIMHC+SL7DBN+RSI=
X-Google-Smtp-Source: AGHT+IFmbF6kHF5CYgFTKY9kVpnNOGbd+UEWj7xjgzYue0Vd5bafoXveZinyizShKcfYmkNqIGGl1w==
X-Received: by 2002:a17:906:5a4f:b0:9a1:be5b:f499 with SMTP id my15-20020a1709065a4f00b009a1be5bf499mr7597963ejc.24.1692967543365;
        Fri, 25 Aug 2023 05:45:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090606d100b0098669cc16b2sm925954ejb.83.2023.08.25.05.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:45:42 -0700 (PDT)
Message-ID: <2856de1b-36cd-1d56-734a-401def967870@linaro.org>
Date:   Fri, 25 Aug 2023 14:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: mips: loongson: Add LS1B demo board
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20230825124115.1177577-1-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825124115.1177577-1-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/08/2023 14:41, Keguang Zhang wrote:
> Add compatible for LS1B demo board.

Where is the user of this binding? We do not add bindings without users.


Best regards,
Krzysztof

