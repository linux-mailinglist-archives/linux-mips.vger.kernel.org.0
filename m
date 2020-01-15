Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7B113CCAA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 19:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbgAOS7V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 13:59:21 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39833 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgAOS7V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jan 2020 13:59:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id e11so339353pjt.4;
        Wed, 15 Jan 2020 10:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=1SLdAde/vZjeqxxnpKqcthZrj/PohN8IdFEkwjDaUug=;
        b=kJ+xtP2rtOihK1qr2NRm5B92tj9k9BAUJppduOWS1pQJUqWUzobOsChk1kqWGn38dj
         paZjPcrLdGpBOzIEZ/g7sHOvvhmAWDq4PPuiT8nLE7r1C+8j6ZZgtF4kEpkpuiSYpQFC
         Bb0nXugdeuDyMtLQK3yWbTiOGUKKRRMgvy7c9dZ9A6fkjQtdhBCAdPYGgbLg7ZmOJu/1
         bcp74AzXKLRLimeeWZdJIxZb0Pu7J5m98xKDhYtcl3WXFUuRg/rxD+Xapnpj6RwwW2tS
         JfMiKy8A86jSKGdX7YSCZE33kfdEFpz9zyGjaVdNjRFQqN1AQa9IwkUj0S+ATs0uxW0h
         +/iQ==
X-Gm-Message-State: APjAAAVDIJKQKJBpjbAumVvsalJb9Vo/2RD1UhRq1uHuLuapilCk+ExA
        nBIbEw5U9S3DNPf1rUNlqdA=
X-Google-Smtp-Source: APXvYqxNfiIM/3c9cK63WOfpQCpjcgkqzvoGKHzmQe6lPV9XOL2x9uoLD1P3Z+lss4AuonnyJ3OMZg==
X-Received: by 2002:a17:90a:21a7:: with SMTP id q36mr1544931pjc.140.1579114759985;
        Wed, 15 Jan 2020 10:59:19 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id m3sm22395270pfh.116.2020.01.15.10.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 10:59:19 -0800 (PST)
Message-ID: <5e1f6107.1c69fb81.495b5.6c04@mx.google.com>
Date:   Wed, 15 Jan 2020 10:59:18 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/2] Add HWMON and WiFi support for CU1000-Neo.
References:  <1579021428-43535-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To:  <1579021428-43535-2-git-send-email-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

周琰杰 (Zhou Yanjie) wrote:
> Add I2C0/I2C1/I2C2 nodes for X1000 and add I2C0, ADS7830,
> MSC1, AP6212A, wlan_pwrseq nodes for CU1000-Neo. Refresh
> CU1000-Neo's defconfig to support ADS7830 based HWMON
> and AP6212A WiFi module.
> 
> 周琰杰 (Zhou Yanjie) (2):
>   MIPS: Ingenic: Add missing nodes for X1000 and CU1000-Neo.
>   MIPS: CU1000-Neo: Refresh defconfig to support HWMON and WiFi.
> 
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts | 71 +++++++++++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/x1000.dtsi     | 45 ++++++++++++++++++++
>  arch/mips/configs/cu1000-neo_defconfig    |  8 +++-

Series applied to mips-next.

> MIPS: Ingenic: Add missing nodes for X1000 and CU1000-Neo.
>   commit 0ba96b344a7f
>   https://git.kernel.org/mips/c/0ba96b344a7f
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: CU1000-Neo: Refresh defconfig to support HWMON and WiFi.
>   commit 1f33d9bcb995
>   https://git.kernel.org/mips/c/1f33d9bcb995
>   
>   Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
