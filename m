Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA40A12381
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 22:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfEBUix (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 16:38:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37206 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfEBUix (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 16:38:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id y5so4319606wma.2
        for <linux-mips@vger.kernel.org>; Thu, 02 May 2019 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lrixnVM86js4Eb2x8G4C6P3hreeXantaWGd2UDDA0cA=;
        b=chVr5+rx4uqvv9JnvlcF5hEY/uWkAw6trA21XiNjJM4Jt2jUlKrsKbdqpUxsscwFiM
         DDps73zEHXct78m5c4MWObS2Qgr8GRFVykEaAwqd/w+C2KRPyBU+SlhfpkiwxmB32WLV
         op/6cH604uZGyac0XM54UOCO5fmKaSVIV/MIYGLKQ/7VtkYldsYGmrTogxlPykX6ZI03
         fHpIIYFYT0zUKBDjpR1EGpbUCt7PJIDI7o0UG2B6PFG3eMGF7hGPrHll3Vl94tlzR/mK
         dbDwtpE+XA0+Wpl5foG7zpR+J0jSdwlMzGjj8x2ZQaqtj+xuoPGs6vOwJlQefJZI1BgU
         MZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lrixnVM86js4Eb2x8G4C6P3hreeXantaWGd2UDDA0cA=;
        b=TqRYOJiSx6EbMHzqe4fgIDUUPiNKBzSziJJ69IcZOHNquVhLzzZrYYhqSaT6XT9zTx
         j4EgjH0Ied9hw2kOzEjZ9r5DHpB0vmuJmY2uEdGSnyPYZ/hH8uGGCw5la2HHmwKNztpI
         Xe2VXRtKBK2gdl6kQbBphmk8aYkZZSQY50WzLkfgHWpXPxel6zEF8PSftp3As5lHcV2K
         9vfVJWAgk/+wdYBWoYxoNsg1+RJV9ZJNnnNfAjhJTzoWjJL5kahCfED7xfcbzog4x4Ag
         fAdEWG9AV85x2hBnnvX6kI9NoSJrYQUEUYvIrIZuoUvM81XYL3NH0tOfluznlIw2AtaK
         cAsQ==
X-Gm-Message-State: APjAAAUe9woANG3FXDFH0q2QoA81gvQZu1Bwz5Rj2LZmlb3SpRpYewzb
        9+8xWiAMi7M3pkACIJ4/K/Ns3g==
X-Google-Smtp-Source: APXvYqzMuYXgDbCdRQnfO1fEHFQY4tfXKNvo0x646Idp9lJeKA7NbrZbvfLcGZ0zkrBCpXxYqigQAQ==
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr3500868wmb.94.1556829531771;
        Thu, 02 May 2019 13:38:51 -0700 (PDT)
Received: from localhost (ip-89-177-126-50.net.upcbroadband.cz. [89.177.126.50])
        by smtp.gmail.com with ESMTPSA id b11sm433820wmh.29.2019.05.02.13.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 13:38:51 -0700 (PDT)
Date:   Thu, 2 May 2019 22:38:50 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Joergen Andreasen <joergen.andreasen@microchip.com>
Cc:     netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net/sched: act_police: move police
 parameters into separate header file
Message-ID: <20190502203850.GG2251@nanopsycho>
References: <20190502094029.22526-1-joergen.andreasen@microchip.com>
 <20190502094029.22526-2-joergen.andreasen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502094029.22526-2-joergen.andreasen@microchip.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thu, May 02, 2019 at 11:40:27AM CEST, joergen.andreasen@microchip.com wrote:
>Hardware offloading a policer requires access to it's parameters.
>This is now possible by including net/tc_act/tc_police.h.
>
>Signed-off-by: Joergen Andreasen <joergen.andreasen@microchip.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
