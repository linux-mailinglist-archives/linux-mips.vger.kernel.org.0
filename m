Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E457D6C81
	for <lists+linux-mips@lfdr.de>; Wed, 25 Oct 2023 14:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjJYM6a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Oct 2023 08:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbjJYM63 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Oct 2023 08:58:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F024184
        for <linux-mips@vger.kernel.org>; Wed, 25 Oct 2023 05:58:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40859c46447so30877135e9.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Oct 2023 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698238705; x=1698843505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3YuyVEdgZZMmRRL1MGrlm9rqrd903CfEJKn3RLe0cI=;
        b=MSNhn7Qpjv60BuUvuzfKHE+YDwQ+/6hLLDhL+WGCiNJPdtac3ahw120xL9ScsQrjCm
         UtkZ0GfPO+USxd+RNJeEjaJ3cATDpKzAHzMUbiU3VaFbMGXsE3ppD+z0kZNTapat1QWE
         fP54zuA4ab52C6Xq/pvb1Ou/OzNrEqcSKMMQGicugLEgvsGrPTzjMx7fJ3dxBuva53uK
         cHMMjMlBBX5f1cAvG4LlXD7vgXiIx61c13ONdsyHGmAK1TgSGnTv/+RsiIl7SjkL7b2u
         vQbUXGjuu2Y5RCeK/xTCX43ASo/BVeZLeZCzCg7djqFmWhCSbiZxkRmIw7HCY7xLg6AV
         pA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238705; x=1698843505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3YuyVEdgZZMmRRL1MGrlm9rqrd903CfEJKn3RLe0cI=;
        b=CWph/L8nRJbXedEniVSPY4QMdsvbeqlthSSduoyu9uST+9aAxGOGhvhcGO8s7wXXr2
         +hIz+A2+LB5PZlFXWfhT90wHlvNd+QRWepfI+yj17iANBtL8yoKOLkS2JRtkOppjOLDP
         SnG4X61jqFmbINEbSAJi4vDbYfkp+YJOAsHWKPo1jqJtta9mhb9OO30zwj/v5iW9nPRy
         d/3VDlM9+Ed6rl4ehac37NkND10p/I1pjUGqtUp3kn4zETc5dT8urtf07wsXKBULVMoq
         HUgGOld6g8E7c0IESLpVOYxp21Xgf7x0e9i62vAynArCkQYotXT9HXtSiF+PJPxI0Txv
         5AnQ==
X-Gm-Message-State: AOJu0Yx1DVy5bteYYHlx1RQd+Fi2HbsLjAPXCODxbcGw0+NWVHa6BZLM
        oO727Fxaj0O6DBUZmd2zqnpERw==
X-Google-Smtp-Source: AGHT+IEfuEPazASgnCKxv7IwMhAjfOdzHBm51oF9N5cDOtNHdSG3LhrgnJUobDy0ZoJFRDw6CgOWOQ==
X-Received: by 2002:a05:600c:502a:b0:406:545a:f8fe with SMTP id n42-20020a05600c502a00b00406545af8femr12935805wmr.29.1698238705565;
        Wed, 25 Oct 2023 05:58:25 -0700 (PDT)
Received: from [192.168.69.115] (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr. [176.171.219.76])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b004064cd71aa8sm14782102wmb.34.2023.10.25.05.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 05:58:25 -0700 (PDT)
Message-ID: <513bc341-25b8-5a57-d760-861a3e88a4a1@linaro.org>
Date:   Wed, 25 Oct 2023 14:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of the Ralink
 architecture
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     john@phrozen.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org
References: <20231022090633.792831-1-sergio.paracuellos@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231022090633.792831-1-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/10/23 11:06, Sergio Paracuellos wrote:
> Its been a while since I am making contributions to this architecture.
> Hence add myself as maintainer.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Hi John, if you are not ok with this please let me know. In other case
> please ack this patch. I can add myself as Reviewer if you prefer to
> maintain alone this.
> 
> Thanks in advance for your time!
> 
> Best regards,
>      Sergio Paracuellos
> 
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

