Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B3932FD06
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 21:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhCFULz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 15:11:55 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:38914 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhCFULm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 15:11:42 -0500
Received: by mail-pg1-f169.google.com with SMTP id x29so3722611pgk.6;
        Sat, 06 Mar 2021 12:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XBcLqA5u+tkgazuztwU6ysQ36Nk3pkPKbmBOp68Yx4I=;
        b=IkwRkd/VbvMx/zVy0w2O+LCuTml/0VftDJaSQgwHGYoaCQHNtTA7L4TRGhhPv9AQhl
         bRKC019AViPE6qZw6kMy1MKJpHB+6uOx0JGNEghYepDzTKnRuARbaBsRSXpdQP6xVZzC
         kenNQ5iaj+g3sNjnBi2Uy25UHuTeMZUZaB81br+FdP86ClnDrxAbIeUszv+ON3OJOGw3
         +LyuMcRS2c+FRIcP5LOMF3y7fpmco5i9oQg50RKWjkKaXvvjB3ZTKmsaizZqRsiF59/8
         nmiFR4fCbho2jGnwNaKZ1oiEVC2YFc5qaXUH3iVcqLYQb/x/Mjj3U/JgoBWtf7JK8F+T
         CSXQ==
X-Gm-Message-State: AOAM53216jODTpHi7uW4dZ3H4obTfSfah2yWoMKdG3P9kczVkTegGt8n
        EoFlcKOKslLjD/fUB0ygwQ==
X-Google-Smtp-Source: ABdhPJxGI1QhH5V3YgvNd88E4SOTIWduhi7upFJO0+j9lJyPpLDWyjD37DkjtBmOUCp4bmcLGkchTQ==
X-Received: by 2002:a63:5464:: with SMTP id e36mr14182765pgm.223.1615061502354;
        Sat, 06 Mar 2021 12:11:42 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id 197sm1683043pgg.53.2021.03.06.12.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:11:41 -0800 (PST)
Received: (nullmailer pid 1139959 invoked by uid 1000);
        Sat, 06 Mar 2021 20:11:36 -0000
Date:   Sat, 6 Mar 2021 13:11:36 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/2] irqchip: add support for BCM6345 interrupt
 controller
Message-ID: <20210306201136.GA1137882@robh.at.kernel.org>
References: <20210223204340.312-1-noltari@gmail.com>
 <20210224075640.20465-1-noltari@gmail.com>
 <8C8FF886-6DCF-4308-B516-17BBFEBADB98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8C8FF886-6DCF-4308-B516-17BBFEBADB98@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 27, 2021 at 07:49:09AM +0100, Álvaro Fernández Rojas wrote:
> Hi all,
> 
> Apparently these patches were flagged as “Not Applicable” without an explanation. Why?
> https://patchwork.kernel.org/project/linux-mips/patch/20210224075640.20465-2-noltari@gmail.com/
> https://patchwork.kernel.org/project/linux-mips/patch/20210224075640.20465-3-noltari@gmail.com/

They aren't applied by the MIPS maintainers would be my guess.
