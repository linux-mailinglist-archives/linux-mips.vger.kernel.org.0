Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6654185A14
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 05:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgCOEfi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Mar 2020 00:35:38 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:36554 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgCOEfh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Mar 2020 00:35:37 -0400
Received: by mail-vk1-f193.google.com with SMTP id m131so2175885vkh.3;
        Sat, 14 Mar 2020 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=05hQH/mydbkf9kLw/BVE0bzAJPp6+Ix4lu/k8QFSHrk=;
        b=YLSpqJxvMli0pmWUwSXpQTCPMX7fBVBl6LUIePPEmrIeiNXwtQekVYD4KDi/kTAOMD
         bq5+2QBWQ09YpAgf7IaDub4VZUlOb0zVtWXO5H2IZ+CXmtfAjFf5ZIjUpZiB74oAz+9n
         y1BD+m3opft4HrcEjwzGf0eD9OgxOxwyRG/t2BQWeCt3606TtYq0paxbB6Y7EgC0j9VD
         HTM2OZvrP9l+Y+Yi+IcNjaJ6YybuecvF9ZokD0K9Oj8RyHVdhdrg17xy9PF6QhOYW0RO
         JuzMXYtv8sR0shp70jtuLJo+HZMyEwBoRIdXjae/HMVUhMZaCUuSQBGg+gZDmMnZgVVE
         zs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=05hQH/mydbkf9kLw/BVE0bzAJPp6+Ix4lu/k8QFSHrk=;
        b=GfCZ0DtkiDUHmyEgzfcBwzwe3Tvsf8/A5Ylz3QQUGCAIlWpLuvR1Quc7BGWvBEFbqx
         /SMSQFiCKTaGxGEGkKTGG3aVUX0ltMLOlDQQ3Q3z2pEbthX7IGL0OTNVy95qfyLFypuR
         j7bcLjcPbjWnFuiUWlJW9uhi8BDVUq7zdkjp24qM8RS37eDxRgdJrT/d8Sj3at7D1dpp
         k7J+NLbfCRmTdWrWWAtpIW0efo/3XMw8n2poLAMPkQC1h4fNKXrUlh80eo6uWQ04ZSca
         2AGpp9h7cEgXLWPSQOjIDkjH49C37mGtYDLCa7luyqlB0+QAWm1wGPwJYL6LWsJbvdBM
         yR5Q==
X-Gm-Message-State: ANhLgQ1RqQnvoB/9Itw0RDBFUioeqMgBQOgchjXWPI+8+sch6ilL3jGa
        vEYQRvq3xhxhEFbikgOJsdyov3G7B1w=
X-Google-Smtp-Source: ADFU+vtkVGDOzsQ5IOyxks1qAgSbddq2JfKkVElfnRsaB1pvsH23gRXnk1ChS0jDsPHcaqJD6CTgZw==
X-Received: by 2002:a17:902:bc47:: with SMTP id t7mr17276549plz.47.1584168591617;
        Fri, 13 Mar 2020 23:49:51 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id u23sm59330102pfm.29.2020.03.13.23.49.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 23:49:50 -0700 (PDT)
Date:   Sat, 14 Mar 2020 12:19:48 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     maobibo <maobibo@loongson.cn>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        John Crispin <john@phrozen.org>,
        Huacai Chen <chenhc@lemote.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200314064948.GA5285@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200313164751.GA30134@roeck-us.net>
 <20200314010744.GA5494@afzalpc>
 <0b41aa60-9869-ab62-4c8e-cbf7c62cdb7e@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b41aa60-9869-ab62-4c8e-cbf7c62cdb7e@loongson.cn>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 14, 2020 at 01:21:19PM +0800, maobibo wrote:

> yeap, this supplementary patch fixes the issue, and it works for my on my
> loongson64 RS780 machine.

Thanks, i will be sending a (hopefully) better patch based on the
feedback from Thomas.

Regards
afzal
