Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D81331AA0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 00:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhCHXBH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 18:01:07 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:46097 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhCHXBE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 18:01:04 -0500
Received: by mail-il1-f173.google.com with SMTP id i18so10387813ilq.13;
        Mon, 08 Mar 2021 15:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oxrNWK58ruGE6H6AXfRDXDV+KPYWrTOroyBMobuwgvM=;
        b=KBvC4uA67yufDSvtuA2SLfK9nqUEV+d4h0wzipi6JoCFquQA6eqjV0cxwNEzjwRba3
         hoYZUXDnds4MiY5PLuRxvWPmZTPSzjkrdx3FcsH4v7dUtiY56Q4NJrGR3M9EqsiHbNOn
         RPubiXyYSUfZ8t5mBO9Zh7Ok5NIg4jUvrYCy4ivvUBbRU359RPmIkKD4WNP8iavPD6+o
         0kV3MAJwnRpQDzQ17Q+ctmuZEY0CdlhlIuPzh1Q1oX/LEVrs9dGdcB2vTt+ujjmtjQsG
         4P89btTad+N74yKZnNr6J2U23cgoWA8BeBISz4zyJ7HdiDVEFRTjhMnZydS3PMqI7IJf
         QMcA==
X-Gm-Message-State: AOAM531uuJ85y4LwCRh3EORvq3w6nAmPJeMvaiIYsPLXObzsavbs08hs
        Ln2CvD/MRqD1o/wpeqeQnA==
X-Google-Smtp-Source: ABdhPJyd+H18e7YFeN3m8Y3It0TTlzUJEeGFALSFSY8MQa56k4fElWDuBiSfBuLw1cy5f+jWVWJoUQ==
X-Received: by 2002:a05:6e02:1d85:: with SMTP id h5mr23307068ila.246.1615244463743;
        Mon, 08 Mar 2021 15:01:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l17sm7060899ilt.27.2021.03.08.15.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 15:01:03 -0800 (PST)
Received: (nullmailer pid 3109928 invoked by uid 1000);
        Mon, 08 Mar 2021 23:01:01 -0000
Date:   Mon, 8 Mar 2021 16:01:01 -0700
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, od@zcrc.me,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings/irq: Add compatible string for the
 JZ4760B
Message-ID: <20210308230101.GA3109878@robh.at.kernel.org>
References: <20210307172014.73481-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307172014.73481-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 07 Mar 2021 17:20:13 +0000, Paul Cercueil wrote:
> Add the ingenic,jz4760b-intc compatible string with a fallback to the
> ingenic,jz4760-intc compatible string.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/interrupt-controller/ingenic,intc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
