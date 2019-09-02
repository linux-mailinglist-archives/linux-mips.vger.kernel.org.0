Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A420A5805
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 15:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbfIBNjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 09:39:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37041 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbfIBNjE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 09:39:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so14074244wrt.4;
        Mon, 02 Sep 2019 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=OEwXy4zNjtFF8UwejK5ay9OZ88LUfnq/LdxudlWwFb0=;
        b=fGyNd6EJVzke4kMtyXP/qtaEyrQN6xJQi7RoCClnp0ryuxDp3t4t0ufwZtJnAW+3a4
         Su8T12y6ISXVAFsD5SA1+RBn8+z8xY8IVnob8l80K5YBTOte/mPMeWOHRrP1X5vmKlaR
         ezDzUJK0mtfGcW2ftJbZJjBJmV0xrYGHbnj/5ReKJFK4KlIi3mQvbhqIoaXbV0Mq3aV9
         e4fY/bapJfw3lYbH/LpzVQRwjYLdntnZffgm/cx/cmTsAFlCYSQyNuqzWwGsJFjCq0vz
         NQ5Ur703gjGNT5aJXO3cCuqpdWhwpmcAWt6z5uAH1fu3lug30N+Sl9OZkEsETRlPDaK2
         +f7Q==
X-Gm-Message-State: APjAAAU9fuZ6Y8HWQVhll7GyBeeki/HyjzPAkPojf81MWwDYOjzr2wno
        qkk6gO0Tr7rSszK/wHf6n0yzfVWqDQ==
X-Google-Smtp-Source: APXvYqx2eaOx+08E8p4ZoGB2o3A/mS3XEiHhTxNJSNCkSkCBzTCwaOthT/af3kEdbnX8ZatbmJ1lpw==
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr18013218wrg.284.1567431542393;
        Mon, 02 Sep 2019 06:39:02 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id q24sm21728905wmc.3.2019.09.02.06.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:39:01 -0700 (PDT)
Message-ID: <5d6d1b75.1c69fb81.f275e.ef0e@mx.google.com>
Date:   Mon, 02 Sep 2019 14:39:01 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 13/18] dt-bindings: Document loongson vendor-prefix
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com> <20190830043232.20191-8-jiaxun.yang@flygoat.com>
In-Reply-To: <20190830043232.20191-8-jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 30 Aug 2019 12:32:27 +0800, Jiaxun Yang wrote:
> Loongson is a MIPS-compatible processor vendor.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

