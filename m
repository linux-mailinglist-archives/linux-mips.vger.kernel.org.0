Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4D915B003
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 19:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgBLSlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 13:41:12 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45351 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLSlM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Feb 2020 13:41:12 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so3625567wrs.12;
        Wed, 12 Feb 2020 10:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bK9qzUlWnpg+0hBwF5lzoTmox1kfj2Ll8ygXpLpFOJc=;
        b=GGbF+u6a4AWrUdJ/Qkh3apMbxerKlUc5ngMYtIQaG8bUtqy4KQGBPL9NWiMSVNKzSg
         Roxppk3OMN0skJ/V6CtwE7Zqjr7MSoSpM1Ti0uwV/PFyzQ8NZBLQU9rhhPvvOsMQbd72
         Hy9ESksArFeQKfAE7jFjfc3XhnGn1r0TrKb6bL1EsdYAWVvWlhnQH31Yi+oZ03Oc7XZJ
         EaMWuqm+HIdpq3F0278+xrSFg0zIF92k1V7s0pnJqhn51sdAujxWDDldUx/ywPp7N32u
         UIeYXfweNVpCTe7FBEeHQEWIOTPQlOGp2ljUcGqj6VNHIQmDE3pN4uIqI0pDCyvl2UpF
         hnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bK9qzUlWnpg+0hBwF5lzoTmox1kfj2Ll8ygXpLpFOJc=;
        b=jkpda/8UlZbXde8ggdGpr86Mq6ZGxoF4QB5xgoneyVvGXuKO9n2zx7M12aUCgyPhzv
         yD5NuFqlTESZ4nmmHwWJU+k+8u9NHemOhmQUW+A94PaHZJRLF66+ZGrby7P7N8rpga+H
         SqEVy86IF0XUCw0i8iWBk9wPkCRAD7W8gfVzhNZQh1Bf98jMW+c0GI5uY86S+TYDYDWR
         V3BrggJ4JYhH9VsMgJ1FomGEbSwcprsM1Y2uFW9XE1mTiG5J1a5bCPl+cC/YJbtNdkk9
         NUAFdy3gyJnVFkkJ1dALPbGFEziMeXuboHrrAF4745hpoQAQlMeC3rh0JBkP5pSuwsEw
         9CIQ==
X-Gm-Message-State: APjAAAVYlB9QrR1Xc1XDSV4CGpqKGWky/gLBZw0PHOjz6cAcq1Cnr8Mq
        Xw0oLbhdVHmgA/nHUi5eNOUIC0/1A2c=
X-Google-Smtp-Source: APXvYqzeeiOXbNyFH2B+WsaUHqdmFLaqkjb64ZLwpug040wXSYBZPeWxwp45uYgYsFg8mNzqIE4OTg==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr16643789wru.154.1581532869861;
        Wed, 12 Feb 2020 10:41:09 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id d16sm1740712wrg.27.2020.02.12.10.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 10:41:09 -0800 (PST)
Subject: Re: [PATCH 0/7] MIPS: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200212101544.8793-1-geert+renesas@glider.be>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <5119fa3c-713b-cfe0-4261-c91ccb01abe9@amsat.org>
Date:   Wed, 12 Feb 2020 19:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212101544.8793-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/12/20 11:15 AM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The OF clock helpers were moved to <linux/of_clk.h> a while ago.
> Hence code that is not a clock provider, but just needs to call
> of_clk_init(), can (and should) include <linux/of_clk.h> instead of
> <linux/clk-provider.h>.
> 
> All these patches are independent of each others, and thus can be
> applied by the corresponding subsystem maintainers.
> 
> Thanks!
> 
> Geert Uytterhoeven (7):
>   MIPS: ath79: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: BMIPS: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: generic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: jz4740: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: pic32mzda: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: ralink: Replace <linux/clk-provider.h> by <linux/of_clk.h>
> 
>  arch/mips/ath79/setup.c          | 2 +-
>  arch/mips/bmips/setup.c          | 2 +-
>  arch/mips/generic/init.c         | 2 +-
>  arch/mips/jz4740/time.c          | 2 +-
>  arch/mips/pic32/pic32mzda/time.c | 2 +-
>  arch/mips/pistachio/time.c       | 2 +-
>  arch/mips/ralink/timer-gic.c     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
