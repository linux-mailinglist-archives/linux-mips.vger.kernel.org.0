Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDB479E012
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 08:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbjIMGeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 02:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238434AbjIMGeL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 02:34:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187241738
        for <linux-mips@vger.kernel.org>; Tue, 12 Sep 2023 23:34:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52e5900cf77so8256370a12.2
        for <linux-mips@vger.kernel.org>; Tue, 12 Sep 2023 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694586845; x=1695191645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=yeuJaLKqW9WUL/iQIcndlfLGXb2KCZtofWCCEJ1KWuPupxGckjys405NEkekj4uENY
         K/uOc6m/u+D+os/ndo9lgez0h47vq90agnqhsWc+Ea5c7Z0DgBhn1F23EKGJM6xQLk+C
         M1WU2+lpjOEdTptwvRyhhsl8p/0RCz0qK2zVeHhJF+EC+LkREBhjPfp0B/VVPbRBZlHN
         GSJKlcCfW2+lwZMKJe+Q3K3Bcqh5EB7+o7ILHqrOiXW+27Z9AxToORZ1j6Qwn3+UBOP8
         PW/Eu0EDKZRlWsJPDgbO+b1OzWIWrKG0J2BBij8TusO1Znt/3TIS/HSwwHuo7VnTyIBD
         OchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586845; x=1695191645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=iaV0p+bu/k88Y8LB7BvmVwUGb6o3zkIu4z1U+6omlvYjS0gujc9gwmGqHY5UadXQtZ
         jbgaCoJoJ1P95qHHjODpCfGxKm4wOHOeKvLZiMyoHruRZqGytPC9cgo6fapwtBfQUKPa
         +IQjkHYpgnGwBbx+d1BXbkyZfd2eNTctqHEXE/fighv2+0OjmZuVOSwZMKHyiBVlcvER
         A4899dBsSmZ0VEPRPbOoMBJ8cGKpMEKEsY8TH9sW6GHx+eWJy9Zrsf5Ob3yzyz1kIgmy
         fhAMWmZumgIVaCIRw4tN/NRsAJrkVGnB5S/EETd3qQAqG2qNguVzrvOOlq+6gm0LoVaM
         l0Mg==
X-Gm-Message-State: AOJu0YyhVdn2wqIkXT21aMl3xx1rlbL7M4wBXsJVU/Bv5ttGI6nSAzFx
        tTcewilw0Lu+KK0ZigkoAHL+Zw==
X-Google-Smtp-Source: AGHT+IH7pVsLeTcuGo1IKYmY0OKmMz3guLsV/+W9YMk15RXLnYgeiGl9YmdqiaV6jYyLCb+FD4rIbg==
X-Received: by 2002:a05:6402:74f:b0:514:9ab4:3524 with SMTP id p15-20020a056402074f00b005149ab43524mr1452889edy.7.1694586845587;
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr. [176.131.211.241])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d392000000b00522828d438csm6829049edq.7.2023.09.12.23.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Message-ID: <7a34d350-9583-9e81-5706-9932a03441eb@linaro.org>
Date:   Wed, 13 Sep 2023 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/5] arch/powerpc: Remove trailing whitespaces
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
        deller@gmx.de
Cc:     linuxppc-dev@lists.ozlabs.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-4-tzimmermann@suse.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230912135050.17155-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/9/23 15:49, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/powerpc/include/asm/machdep.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

