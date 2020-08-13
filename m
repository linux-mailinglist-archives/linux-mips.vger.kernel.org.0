Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F50F243DDC
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgHMRBh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRBg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:01:36 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB91C061757;
        Thu, 13 Aug 2020 10:01:36 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y10so1323537plr.11;
        Thu, 13 Aug 2020 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=bMPi3Hb91m4f2fahV5rSw70eU1LIGA2qvL2oDpkfeN8=;
        b=fqk65p6hWFcj1ijh28KN+3SW382vhpISHMK1MSil5lPFmM36Q3Dmi45JzOGPb4fg3U
         LcOzSXPo3HYO8M4xqFrPXlmw1oIRkk5e1QDNK2ebBcPIfLTyn3PDRUs5v8B06nMM5SAW
         y7Vc6x0g/UfMbDqJn/HoKrh3dGJOC3PCz9sgJY11f+SAC4WE1jeIGra8KYeB8VewPu1s
         aUe6aw4OxN/pCdF44JabrPM0pjvhw8RNWCjtt6TWb5zlr7EdzGI8ght+bVRlB4xBrYlW
         ztA6aWrbkAlQEmOQFQcj26IQOMAixUK6js0Vgm3KIc9ri4TdSQqnWI/qqz+AonJs8VeO
         6e5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bMPi3Hb91m4f2fahV5rSw70eU1LIGA2qvL2oDpkfeN8=;
        b=iCaH5FjLPEa9fNPT95sonyfHs7lDGrXAVSvyPZfjU55biSn+kXizova8WIEBqcAhqW
         CLz+GIyyup7qlALgdJ5hw2bLi5Efmm8MVJ8tVGpkoDkWz1EcgKTDBDBZaQ5Fxvv07WGN
         9BKDkm97RLcdZ4NsB9NBqDkYvuUhT8DeC2W0EZncQk/WECBoMWZ6KSAjCWK5QfxtzWKd
         Ybs995BTFZ/91q+7yaIlbRIYpE3EuayJTu2QcrekmZa9/iR2eDH0mZrBPm6v6q03q8I2
         ySMGFMaRfsR8deNQIoboImEVfGjSuSHvIYSBowbJP0yU5wGN0NEHNzpo2DrNtHedW55M
         ryVQ==
X-Gm-Message-State: AOAM533z1YM3ISwcoFK5CHhNSjlOGD9DvjtQo0brhXMPX4UfFTEIdqI8
        eK5gwo34l4gykRlNcPoOYgfkzOXs
X-Google-Smtp-Source: ABdhPJyTx160T6xb3ua+Joq7HDMvOHOGZbH3Ch4kMybr97+2wB9cwVyzObScw1k73X11RjpzP0JUaw==
X-Received: by 2002:a17:90a:ea83:: with SMTP id h3mr6525137pjz.170.1597338094554;
        Thu, 13 Aug 2020 10:01:34 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p9sm6094693pjm.1.2020.08.13.10.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:01:33 -0700 (PDT)
Subject: Re: [PATCH 04/14] mips: bmips: add BCM6328 irq definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-5-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <95de3107-4787-fc94-9b66-0b76ef5146cd@gmail.com>
Date:   Thu, 13 Aug 2020 10:01:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-5-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Add header with BCM6328 definitions in order to be able to include it from
> device tree files.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
