Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D482F8F36
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 21:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbhAPUaI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 15:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbhAPUaG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 15:30:06 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A428C061573;
        Sat, 16 Jan 2021 12:29:26 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u14so6342331wmq.4;
        Sat, 16 Jan 2021 12:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dx1C+ulHEMTjOYP7fq7N1OBcBMUm6/ktsvewWHn76/U=;
        b=SUDRmraR9fFz+okCrgCncyKO0d81LFusWjWOGxooe6gDOr7btRBFrN7OnpRXR1OP+e
         4xlGFQE6k0f7UAZ54/sYgNXCkfEGYrbo1h+/iOgz3tzqyQPZ1WNs/Dfei//JWr9L9sA/
         n5ow42KJErZSHIYeSG69VxpMnxYghPXXQQEcXHvF0WgqrkpX1B7rPiTfqmJQq9loROC9
         /HlHalxoLRlCBU8phulKEnzG/HXelRpwidpQVfbV+WmpCcR/SiT26YcD3CIDZi1Hfl8f
         K/OZI03msH5OinhmLe07SMAXdfUGGQFOwVqTJeOdg+e/c4f9IbvxlSdDxV+832P7APYV
         WmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dx1C+ulHEMTjOYP7fq7N1OBcBMUm6/ktsvewWHn76/U=;
        b=IwRhdf7TdlPLCQTTlegHsW8ElPRJg0L/VYFl3cOoxaj9r8zuGKJ0qoyzrTpmXusxnY
         iZ/pxgG2rLhK3K1Jyr29eUv1iBZH+RPTS5YtscLr8weHFsRtUPGiko04RBWk6l6js2s1
         s1uP3lDM53viwipibI0BiMAA5UfJDOxiLEkfX+tTGIh0Ddaxz8IdaZGUWSm2aUrHWGyK
         Ww6/ILHF67MIDVMh7gCmrY1yDf2nhQR/Ps1x7L2n7DrGBm6M1hwLl18tqKV4+TQ6/Tqj
         jHYQyuSQwdyKk25p8uG0aejodCwDzv3eW4HLDpYCumXygjTFN/39WM9X8uEjjucF2bmA
         7rLg==
X-Gm-Message-State: AOAM531XCZKWFeC0oDfcYaL/hSPWbe0ykz++/NpODzVPMQlwfN9cUpQw
        kEuYBTdbBsIYu9JLfHcKmpk=
X-Google-Smtp-Source: ABdhPJwJHRhJNxpuAQLVxX8sJPPQVT2eqGEoQ84RHRqJK59k4c3m2QgASaCs1Cjlf5G73/ZxJaEL/w==
X-Received: by 2002:a05:600c:2905:: with SMTP id i5mr13998611wmd.28.1610828965050;
        Sat, 16 Jan 2021 12:29:25 -0800 (PST)
Received: from localhost.localdomain (p200300f13723cb00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3723:cb00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id x7sm16209988wmi.11.2021.01.16.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 12:29:24 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     olek2@wp.pl
Cc:     devicetree@vger.kernel.org, john@phrozen.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, tsbogend@alpha.franken.de
Subject: RE: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway CGU bindings
Date:   Sat, 16 Jan 2021 21:29:22 +0100
Message-Id: <20210116202922.147964-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210101180118.2496-1-olek2@wp.pl>
References: <20210101180118.2496-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(sorry for only seeing this late)

[...]
> +maintainers:
> +  - John Crispin <john@phrozen.org>
personally I think we should get at least John's Acked-by but I don't
know if there's any rule for adding a dt-binding for some other
maintainer

[...]
> +required:
> +  - compatible
> +  - reg
based on "DOs and DON’Ts for designing and writing Devicetree bindings"
from [0] I think this is incomplete
As far as I know CGU contains some PLLs. These PLLs need at least one
input: the main XTAL which is found on the board

Also the Lantiq code does not use the common clock framework yet. Once
that's used we also need #clock-cells = <1>. I don't know if that
should be added already (or not).

> +examples:
> +  - |
> +    cgu@103000 {
this should be clock-controller@...


Best regards,
Martin


[0] https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html
