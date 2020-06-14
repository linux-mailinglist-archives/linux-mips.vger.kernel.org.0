Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276DC1F870F
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgFNEs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEs4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:48:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB26C03E96F;
        Sat, 13 Jun 2020 21:48:56 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so6113170pgk.11;
        Sat, 13 Jun 2020 21:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PgJ5b+UEwrozzGSOBAFI1RY5zGb2lRM32/G1o3U/E7s=;
        b=pq/RszAMYiboOsEOWEJtEVkBio/+jaPIwW93WsfTlXvOATINwbRfKl/n2gP5VCIcs5
         oH7RbiQpwSEgqmFKWcsjE7Qk0mU0AUJKMiSzausgfzp13GznRvtcvKTwno+DeL15huN1
         TGAsAJJecuoa1cq9EeRQqB4JQk17QCix78ageHpU1rd81AiESg4fAjiGZWJbckDHYovi
         XOjBEMAyqLivGRCzCjofEeOQDcRVGvQxXfUaK+d7Kt+Iv73aS2MXBP/QUFjHbOsWed/I
         UO9zLBkFViRqu9aMqqIFyN3fUMfeOiUn55+ZewlNF73IVvfuAMEyi4lD+Sj8K7TfSYE5
         d5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PgJ5b+UEwrozzGSOBAFI1RY5zGb2lRM32/G1o3U/E7s=;
        b=lKWOd7VYBuE46LcSdE2RyTVdlzdt0xeOS67ld/xt1HoP1Ojcx+EAljJGqpheJdyxJM
         mdrKPa1FJn8uqZ3OlGPno6umQwjBUerzAmsLSuZv09g+B/JCVkRWWGeiH8nF+28ynToF
         VyU6oiItW1ZW8nSw3VELZLZ6hjG1el+iMaNkai6nO1hRWj+ociShpJUR6UiQGCBsWKUv
         N2tXLtpKi4KxGhcIcLAHrD0IXO+joFsbLEteRK/o9cjCF7KnXZDd9jAK7GarCKhapswI
         2yEn65NXmeTuebYJ2pWzPVXqCnuqQh9k4NZGgQkFKiWsYP7oWr8x3ooHpG6ZkaHebaPf
         MUAA==
X-Gm-Message-State: AOAM533Cr8D0wmjwCZKgORxpdXMa3ckVmH9RCJOcmhAhucVMndlouVUc
        aRpSytxTzfsNWBbkvMwf+tw=
X-Google-Smtp-Source: ABdhPJzii1q4w0HLM+bjPy+t+uAVibzzPFXm3fCuKpih9ad43FpQGmwaXgAFkK2O4rhogh1lZ6Jkfw==
X-Received: by 2002:a63:1c15:: with SMTP id c21mr11679662pgc.363.1592110135692;
        Sat, 13 Jun 2020 21:48:55 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id 130sm9905158pfw.176.2020.06.13.21.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:48:54 -0700 (PDT)
Subject: Re: [PATCH v4 6/9] soc: bcm: add BCM63xx power domain driver
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-7-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <40e2da52-1242-ac96-046f-b3622f9099d3@gmail.com>
Date:   Sat, 13 Jun 2020 21:48:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613082140.2009461-7-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:21 AM, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
-- 
Florian
