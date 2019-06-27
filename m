Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A5F58BBD
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 22:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfF0Ui2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 16:38:28 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:36856 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0Ui2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Jun 2019 16:38:28 -0400
Received: by mail-io1-f52.google.com with SMTP id h6so7782718ioh.3
        for <linux-mips@vger.kernel.org>; Thu, 27 Jun 2019 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C2NglXNy4nr7hbIBx2q9NkzSxnGX6YwBBMbEIYdwmMU=;
        b=ksTJlA9sJ447+dn2iua8o0tnDdvbZKns15E7UjwNlceXakBb8qm6mudxe0dN4aqzVG
         b02w4o3ojjCshOt83dXc4gPik7C1egdIpasMUsn8uQkCllu8z5LDAF2ZIg7ddE9hEfhF
         wWUAZ3h8aY48xBrzE4Q5xw2hJrHTPcu4tRrOsj+y4FsnJpchEPOEzf4KANc7W+2BMBUt
         gPVrDUR9ZXUBYE2hPXsqqvrMnY0LDiKSeN/4gVDWEFwe/YWv+5jBwzXdsuogS8UcJC1n
         MaxfMFm8yKLFzTl0coy/T5lsUftN8+IPXN7X46VXz5XraWj1SHxsIpj4ohLSKOOiwmjI
         saYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2NglXNy4nr7hbIBx2q9NkzSxnGX6YwBBMbEIYdwmMU=;
        b=RRQNkDe00sQ5ySGmvsJeHppHJcACH0VmlW2sGjMxJAfoatAMyj3PVA3J9/BFLq4/b7
         F/Mkzpd4HmpEhTyQ+sT3iKdLQ7AQCtKXlbTfG05+UwIe9Epla117gYEh+q7lHB27hMPD
         gvkPrcTnXU143+UZbe3cVBnQbdX2HbHnBCCLfY8iExRtFflY/OunEibd+1d3uCrHJ532
         5Tlwa9ix6k4dBtcj7XEtc55tH5zQzTIZagCRfZ8yZfHZy18eHlroCWvtvGi+/a8gRybZ
         YHO6JCLDVSAqLPdh/wVgV1EWXUoKOLJRcUvFTd0V4TPpKdYXHs3tNYEsOVRGWhg9zfKW
         AGgA==
X-Gm-Message-State: APjAAAUuMLGKtm0PhU9HPSTQglfp6thDPn4uANFqA2cWwuw2vAsDQZ+F
        JIDUk3SFZB6RrO4NDO7XgQKgP0aewWJ/IsEmHKs=
X-Google-Smtp-Source: APXvYqwTX7PRJNz/QRCmrw6xiXSfj9/Sr5yTRovWs90m9dnFeUXVfzrV/E9IqecBpZxwKHNCFSM/CUncNHUJX50mDtk=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr6755122jah.140.1561667907455;
 Thu, 27 Jun 2019 13:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
In-Reply-To: <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
From:   Matt Turner <mattst88@gmail.com>
Date:   Thu, 27 Jun 2019 13:38:15 -0700
Message-ID: <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Carlo Pisani <carlojpisani@gmail.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rene Rebe (cc'd) has a YouTube channel [0] where he posts interesting
videos about old hardware, including the Octane [1]. He's got a modern
kernel running on the Octane.

[0] https://www.youtube.com/channel/UCJLLl6AraX1POemgLfhirwg
[1] https://www.youtube.com/user/renerebe/search?query=sgi
