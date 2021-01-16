Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C277A2F8F3D
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 21:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbhAPUfo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 15:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUfk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 15:35:40 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3533C061573;
        Sat, 16 Jan 2021 12:34:59 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id d22so2360978edy.1;
        Sat, 16 Jan 2021 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a73n5pAnB+P6IPG8V8MfXs8zF34tD/FahmEduHIQin8=;
        b=mDehsDSBxWifluWe6tgscuDC8QikOu9YnvTFnvYnSDmOCbPXPuqGrP76Ez2W+y9z3r
         Ue/NNCgjR9HVnfCfdFYWXPdNNpzOHWF7qpjoOJwBIelCkPYtBsJlI8kVf8CBSZJ05NRX
         8ozkKrPiSWkejB3AoBnUtSf+wdftD7HD5dCtSfrmFE0xVE2rb6uq/4o5oyYZYCltNmB0
         SXlMorTPLI2oImft90+5DZ+vNjyL86mFlZ2qoVgCGze2/wY004jXDIiVx6p5atWUczfg
         l1Q5zNTib3SDXWacBOOqGbWHLP0IY1JHF7irtKHjHxL+AWcs5jJnSV02w0dFM3czDF6y
         zDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a73n5pAnB+P6IPG8V8MfXs8zF34tD/FahmEduHIQin8=;
        b=qhb2wdhUZn1gKyh3IpMPDN1Qy4ZlhmF9aRhEbZQjXcIw6Md1fqAcALzg0lpVmDaPU+
         4CAxqsUnUxY9Hp5TZbTmA5GbVig2GLUH7mqbdMlEi2YGyw1qlp9fKJ8nA9CZHUlT7PS3
         k7hEBWdFml+t6c81KAmA484rIvkGnGuWjaBO+76yqyo9wX4a6GJJbHohHD5XB+nNGQxJ
         8ayRvrtTwyT6gwouqAWSEDriYUT22em7ev5gBFC0YbiUOLnuFMVSQ2ODEzeocNY7o1cc
         a8XH5rKkrd8A9pqOv4hUWwrX37TW3tWCG26foIZ5okJNFu6D4eCJ3tZnRV/YFFpXIgAv
         narw==
X-Gm-Message-State: AOAM533Jt9dRih357U3QpH/wf4QI9gY+VzE5QnJHi7qrRk3z1i5VxqB1
        gMndaX3rIb9BbXuDK4/QJCo=
X-Google-Smtp-Source: ABdhPJzekSyc4UA44U+r1BdsHaXKpFKU6E7EhcOHoru7JjTIgxbV0NhL1BeqbJ1VPGBRkdagBel+3Q==
X-Received: by 2002:aa7:c652:: with SMTP id z18mr13534552edr.60.1610829298552;
        Sat, 16 Jan 2021 12:34:58 -0800 (PST)
Received: from localhost.localdomain (p200300f13723cb00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3723:cb00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id d13sm7751959edx.27.2021.01.16.12.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 12:34:58 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     olek2@wp.pl
Cc:     devicetree@vger.kernel.org, john@phrozen.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, tsbogend@alpha.franken.de
Subject: RE: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway EBU bindings
Date:   Sat, 16 Jan 2021 21:34:46 +0100
Message-Id: <20210116203446.148603-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210101213759.2070-1-olek2@wp.pl>
References: <20210101213759.2070-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(again, sorry for seeing this patch late)

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,ebu-xway
I think this compatible string is very generic and with that comes some
problems.
There is actually two different versions of this IP: one which has
support for controlling the interrupt of the PCI controller on some
SoCs (Danube, xRX100, xRX200). Other SoC variants (Falcon, Amazon-SE)
don't have that interrupt-controller as they don't have PCI support.

Also there is at least one clock input. I *assume* we need to describe
it but I am not sure (as this platform doesn't use the common clock
framework yet).

My version of this can be found here [0]. It's still sitting in my
tree because it has a dependency on an ICU patch in my tree which I
could not make work properly yet.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/blob/8d5c632e11fe0ca14497efc2f9d99b69f75590ba/Documentation/devicetree/bindings/mips/lantiq/lantiq%2Cebu.yaml
