Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C081F4AAB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgFJBIt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgFJBIs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:08:48 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64833C05BD1E;
        Tue,  9 Jun 2020 18:08:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v24so281449plo.6;
        Tue, 09 Jun 2020 18:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gG4DrLEnN5VoVbJYsL5F4CNKxTUk8l8aMmvI/2s2XSI=;
        b=Q/RnglzEfTrb7Y0JKrulynYsX/Z/wN8CX7FTizmAEZBERAoqog/r3ij/Qb4/OscaZf
         xX7AJrsX6vK5WycpgBSqhyBF1P4CWPXKCNdm7dNwVct3Ru1edFk1aYeHP1X2jWAfTqLR
         s+GOMUizR4BYg/bryU2aJ3TnkE0tJDw9CI8yeP+duv0DjD1B23RMvn/rJP5grLP3106p
         KkjECTQGfHjvH+/g88sZB/KJyt7ToofrmhA1nduxY6Y1UmWblKyBqmT/TYJrjCR725ZX
         FL6fTIcy4hwNRhsg7My20R017F3BXiw20zLitypdkV65mYw8onsLiLTqKW1gTjPmFpXs
         w2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gG4DrLEnN5VoVbJYsL5F4CNKxTUk8l8aMmvI/2s2XSI=;
        b=CM4Dy9FNaRqvQ9NSZxUIUa+T2AVZ4s4x6KYLQ/TWaxKd+rkCHSVOjRBWZEGRIBdK2u
         N9UMFXSpiqKRV+1p4Zd6UDUsICEAeCZL2UPpbizOtOfz3MZwUaUoEOqJhmZV+s3vyBtk
         JOK3trGe+//FmQW/k/EnBmNTr4P6b9snQFpBC/zeIzQTeZUbTCLT3wcLD4eypCMq8x9m
         i3tKebCp9Aon38KfHjUswvgIiAIWc6NhylChnw0gXoCfEJ/PsYY5uWxR4usy/jXOMIQB
         fgsEtxlBOcmGJrlPGpgbIZrDF+aDyeoIq4HeOIXa11CckdQySD3CKBUNyN6KwW8FE7qi
         xTWw==
X-Gm-Message-State: AOAM531qB1SwoFtApIWawtRcKv1u32dXaKrHFpww+ZlkD9li4g8qJXt7
        Z+N/UR7MsrNWrR1mRpJSaws=
X-Google-Smtp-Source: ABdhPJxk7mSIYaNe+Ul5XsBqgbcxf9wW/0l1NpO2rc75MH51gR8sMnc2Hl4SwgOGZUHyIY2i/NjoxA==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr535974pjb.19.1591751326915;
        Tue, 09 Jun 2020 18:08:46 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id fy21sm3425191pjb.38.2020.06.09.18.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:08:46 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] mips: bmips: dts: add BCM6358 reset controller
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <06a86fd1-4233-cb92-1582-1b4e496e1c96@gmail.com>
Date:   Tue, 9 Jun 2020 18:08:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> BCM6358 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
