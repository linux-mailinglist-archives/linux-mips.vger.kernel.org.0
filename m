Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC25D243DD5
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgHMRAT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:00:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EEAC061757;
        Thu, 13 Aug 2020 10:00:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 74so3099213pfx.13;
        Thu, 13 Aug 2020 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=u0m8TAumzmBHEsZ2h9VPYjtMu5GCezpUdIKlpNXiBAzQSwGlfkoVPvTtoQGIDFVlC8
         5Z/Vy6YLY1V92uho/97cn100zel5XACKuOxXIDPdC+VN/IWBXws8Z9Bc29suhIdRBJAo
         7qRiQqbYEjGX5LW2/9olul+LINDOHrBFO49euqyfqIOdQ5W+WYbpMRZ7KJ2QXa5028qS
         TyYVcmVeY1Oe07uniet/frjXl3iGh/ljTFw86FsFqppNVGuKvTKuMAMTzXpC5u/QaPS9
         DAqxAer29MWsJ/DbXgX/hZWFg3/HC3KbA8D6WL485j9nDhyGpYZPny469PGVMGf7Q4oH
         kOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=Sk8PoCrSlgfAhLxFWp1/FCGBZ90oKydKF9XATo5+ip/s+Gnwemez7TYndanA8buGse
         2AxBrPkXy+Nz6SOvPqWyLjuH6soQ9UVWNQ1gu9rbV4dPBAlNDg8sZVD/sCz2VAukmf7e
         Tim4RJzlCj1mseU9n82ApYFi18gwlHcM3lHM8+Y+/0PC9bO7j7yPB68eNq8Z91kj6hZf
         oT8+CduFVz/unXqLxgBXoQYE7ov7NcfYjGI4K4hP5GwGCEilYshOlvPHL1H+sXbqo5mn
         +lhagVEhCHoCRZ/PvsR2KmqWy3QgzklRezecu7AntIsQHZYWo7maswVWaeYtxoKuEyc4
         bnHA==
X-Gm-Message-State: AOAM5319FGWpFORH/g8uKQwrL3VxxTzmH5l1sMFlteTZNYGULBFePnD/
        RX4nvEMFlDyNvHPCdmIaTlr04rDK
X-Google-Smtp-Source: ABdhPJwESjPLNoZUGvOR1XEgOPjDBy5ivqoHyl9E2DuqJvuw/APQXeRNXtCRi6MTwp8Ofm1YT/cYTg==
X-Received: by 2002:a63:8f41:: with SMTP id r1mr4360447pgn.375.1597338017762;
        Thu, 13 Aug 2020 10:00:17 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z25sm6632296pfg.150.2020.08.13.10.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:00:17 -0700 (PDT)
Subject: Re: [PATCH 13/14] mips: bmips: bcm6368: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-14-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e71c0b06-6ab0-e311-5691-6e53504e29aa@gmail.com>
Date:   Thu, 13 Aug 2020 10:00:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-14-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Now that there are proper device tree bindings we can start using them.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
