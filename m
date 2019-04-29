Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF39E64D
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbfD2P0E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:26:04 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34504 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfD2P0D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 11:26:03 -0400
Received: by mail-ed1-f66.google.com with SMTP id a6so9533110edv.1;
        Mon, 29 Apr 2019 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=aonALYgL+fC9zvkDd9D30wIh1ca4DE2TOFz5g+1UCQg=;
        b=MqOlHKGBUrtkGw/thEAiOVcQipneXzleb0RM/WE/NAIrWKwuZ/igOcZfZutIC36Y+D
         kLv5JhJxZNlHfPV2unFalEBIn+R251ZYHMnUFKHLzWPTKPDBh4j1DH5fBQWKGZMvzLVb
         SMz6kHEmwAk1jVmwT0zVVqmJxkqUZFnh5Be3UtymNcZBxrZC1dCeA8ZWGCke6h3WuDTI
         PsjH3VSHWs1BZGE7yQ1Vs9L+vcwsR8eXgeZFz0UjkEq1+l6KvTCFALNtGLuE09m3CghC
         cx6yoPLSQGZxVeq6086SUPMPKPbmJkifbBv8cOkt/YaQS5IgtCtZFbdEKFHyYcct3Z1K
         HqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=aonALYgL+fC9zvkDd9D30wIh1ca4DE2TOFz5g+1UCQg=;
        b=oreQoeFV56KpNe1UbPOkHvD/GBJE6e5phON4qyYTD/KyEIpUcJ8nZWlyxz9s5jeu7c
         FJMys67UXRGdh5FrPUKh3l+GDOuYAHCYUljMRGSWiyojJukVLrMV7gOjrsLnnSd78wty
         do4jYoiSktEdPanVqK2Y6mhrK1lmTMZuTI6dx3FWETU+0zT0jZFH9A55kHKh+/l0MaQe
         5epYXLS9l4NqYOKJegTXbPvdRrY6ZCvUnmIJWcb5zldrH+THUCoM8sH2fzQWOpti5Zsm
         oSOyY5ay7hshntcW8I9pejovY9BAw3yu91qqvOYEQY3hF3RYeX3aMmJKwYGeaZ4pSpDY
         yp0Q==
X-Gm-Message-State: APjAAAXQEO60ZV1oMlwCvqeboCQRT1NAGgCiyHHDqtKxLIwETYoa1mb8
        dy6jIwOWYUGRQEXhCz7wIEQ=
X-Google-Smtp-Source: APXvYqyEQJEsE2ti6PwOMykBv5n2TIgt00/3l4kIKwcwjUrTagamP80EumknDfmmfKrxqeVCL9NbNA==
X-Received: by 2002:a17:906:4c95:: with SMTP id q21mr31492152eju.14.1556551561666;
        Mon, 29 Apr 2019 08:26:01 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id z32sm862711edz.85.2019.04.29.08.26.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 08:26:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
        (envelope-from <peter@korsgaard.com>)
        id 1hL8AK-0000pF-C1; Mon, 29 Apr 2019 17:26:00 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org,
        andrew@aj.id.au, gregkh@linuxfoundation.org, sudeep.holla@arm.com,
        liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
        linux@prisktech.co.nz, sparclinux@vger.kernel.org,
        khilman@baylibre.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
        linux-amlogic@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net
Subject: Re: [PATCH 12/41] drivers: tty: serial: uartlite: use dev_dbg() instead of pr_debug()
References: <1556369542-13247-1-git-send-email-info@metux.net>
        <1556369542-13247-13-git-send-email-info@metux.net>
Date:   Mon, 29 Apr 2019 17:26:00 +0200
In-Reply-To: <1556369542-13247-13-git-send-email-info@metux.net> (Enrico
        Weigelt's message of "Sat, 27 Apr 2019 14:51:53 +0200")
Message-ID: <875zqwrfxz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Using dev_dbg() instead of pr_debg() for more consistent output.
 > (prints device name, etc).

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
