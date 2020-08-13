Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80139243DDF
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHMRCL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRCJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:02:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A90C061757;
        Thu, 13 Aug 2020 10:02:09 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so3040482pjb.3;
        Thu, 13 Aug 2020 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Onfjxx3QPjuE8hddFaQi9ZnNblUX831MQmXGwEYmg54=;
        b=V/TUVJJskT9sJdBJmSXoNvk0mta02myTFxvsQNq2+1p1WeG/RYiYi4KLstj0zyWEtL
         HQCWtlJM2CPhWsNdqpDwVAWTpV1fN/k3L86wsmEufDcZ8tH0zlzIEKDKXdsMDCD8bgQY
         Qz3G3yjjKAR55xAmTE/ATOkb5Y23USPj5BFQj2xZDv1Md/FRTzN+kQI4OEhErToMIV9L
         aOy0qN0NodeIlWRzMCBi8uWNdmbUIXQ84qaBeGsfYNqxJXbLnHXRv3XrJ3N0H5dyqLMF
         L8XSshDmRdArl40qEUkkNyQla09GjwL32C4FD2pxmi5+7w7OelCC4DDn65qPEkLj8t8D
         CEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Onfjxx3QPjuE8hddFaQi9ZnNblUX831MQmXGwEYmg54=;
        b=tGfjkErsz5JlX88QhgA7XVUVSh5E7c0TJJMzszI8UBkmkR7XfgixNf2llxJAHqAeBI
         TFQ4vk1Oy5m+l+70nwx9UfEa3J1Xs6/9MgIBRuDcVAi7fJ7eqkzol0IPmcNZ7mMjYJ4i
         6a1AQzi7KAY+VIUDs5bY6Fkd109ELoWytxbzvxdUJnDnD49kZ++MQUexpxHlNw10UgPK
         3zQbm48EGE3pkZ5abKPQh/8DOLe/unfujTDeLDfTBkXzKNgKpKGc1o3Sv/FNQkQ6tHlh
         SAlqv5LVLJfznTU0sWchpdCHl3yxMEmzpYot/85LOyBbEVxPcQTFJSPSDm1ay8iy8CR/
         dJlw==
X-Gm-Message-State: AOAM531ylN8XucgBPB3+67HsfoArvLz0jVKZS1/GSlJt8N17asRGXjIv
        MLbvRKjzvsabc7Ul4XtHmAJsCgD7
X-Google-Smtp-Source: ABdhPJw/GwJP0AbRkheu4UPhUDA9+n3YWAq6vJizFugkhrFINzpnBX2ZKI9bnTADnm983G6sxNoDQg==
X-Received: by 2002:a17:90b:11d1:: with SMTP id gv17mr5758217pjb.167.1597338128148;
        Thu, 13 Aug 2020 10:02:08 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e125sm6469754pfh.69.2020.08.13.10.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:02:07 -0700 (PDT)
Subject: Re: [PATCH 05/14] mips: bmips: add BCM6358 irq definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ac55330c-e1d4-2e7e-f0a9-c1b06ba37fbd@gmail.com>
Date:   Thu, 13 Aug 2020 10:02:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Add header with BCM6358 definitions in order to be able to include it from
> device tree files.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
