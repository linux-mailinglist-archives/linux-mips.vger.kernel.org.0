Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED56D1F4AB2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgFJBKC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJBKA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:10:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B135C05BD1E;
        Tue,  9 Jun 2020 18:10:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id m2so164381pjv.2;
        Tue, 09 Jun 2020 18:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=TlNK+Tlk+aN5NG9BUYYRn8bnTYvuA5V5oW0F3jDiGI0=;
        b=W2EiepT9tyd9qE3XPqyraL2QAwr+zY1/YjIjaj8RKEYesTka68P/QhbHQ7tN4X0mqR
         WLTShHwgsRVrGqdYu6qbaZOlxuN5bfmcx7L9rUOX58JO5/Wc138aYTztb6xhOdrhoe46
         FZzm77XdFOmP7c46d05JYoJ4vgw2se6zXOyjxVxsimGZMtnemWPtI2bJqFcRrpChLGU5
         bJ6n7NnPmeGTsEZ5pePybAiepoOGGJAkVAV2tIHr5al+QyyCsTEMdj2n9I4mjpYQactJ
         Jmaj/SmMLCOMHu0razGFdHf/sOS4jFXfXC3tBkU0Vd4yJkKId5fDdJyDojhg/LJaECuD
         ozPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TlNK+Tlk+aN5NG9BUYYRn8bnTYvuA5V5oW0F3jDiGI0=;
        b=O5DqBv50eVMzfWmf00PaVWt+Q6GoBcBJyRfhICumz7h8Y85V+qzbwkOvRe3/W2xVge
         +qCa2DvR3d+NmWbqqJosz0h1xg+dOvVGQ3fT1jv6KtMSu/TFp+WwrlzaZKxq2ouoM5AW
         zMspWPow2qaC/Tm089KKI/DYCdDyVT0l51IPnIwIWBEajLRtA6rcfFRpj2QqYqwRLtmx
         44Rlb0tLme3+arbzNVlRUalmW9egrns9APloEvHFaBPN78dqgfL/d76aMgMCGL7NY8js
         CuVjpFzlChxXow/FbTAXfm6k0jwbr1DLP033XapTfYk9FkZlTFpLiW66TFb2ANxQvfmX
         /J+w==
X-Gm-Message-State: AOAM531ExWu7BX6ByfL553Ai4cWFE2ZfO2hmtyUkEb7mLwlUOUtqZuxy
        Gk+huJECvDSKXGzVtxXp7Ns=
X-Google-Smtp-Source: ABdhPJxcyoemOSl757nSd70O6TqgMvhFovcGe+nXAl+iOmaBlLcBgW4xWZuPE79QpMulYqqaiT631w==
X-Received: by 2002:a17:902:fe01:: with SMTP id g1mr943995plj.254.1591751400059;
        Tue, 09 Jun 2020 18:10:00 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a20sm10585016pff.147.2020.06.09.18.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:09:59 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] mips: bmips: dts: add BCM6362 reset controller
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-7-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <dcdf222a-257a-20ae-e7e1-429e665d0e3a@gmail.com>
Date:   Tue, 9 Jun 2020 18:09:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-7-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> BCM6362 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
