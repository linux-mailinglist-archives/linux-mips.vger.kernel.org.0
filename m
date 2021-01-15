Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DAD2F77D2
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 12:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbhAOLlK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 06:41:10 -0500
Received: from mout.gmx.net ([212.227.17.22]:44445 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbhAOLlJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 06:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610710776;
        bh=HzXb0XCTIIHEzOUgXGhTZiD9ozfuCZn54d6BLK27S1c=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To;
        b=FgSdDUgT3RV1ofWwJrwv76q00BAQsN982ZZvPcQETq6/SlyJKdBEC8sK2GcqV7P3X
         XOh1WwlL7H5CPpMTl/SIT89dNj5QgcvbLeRZsrMvhLa9D8VjJKOG4151XqZ6YkGPd0
         +QD0iGcOuOHwaD3r+nnhg2sDrc9xfm7rIBnsjiHY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MulqN-1lrW2N1krz-00rnQx; Fri, 15
 Jan 2021 12:39:36 +0100
Date:   Fri, 15 Jan 2021 13:41:16 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     cand@gmx.com
Cc:     hdegoede@redhat.com, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: [PATCH 3/6 v6] fbdev/simplefb: Add the N64's mode
Message-Id: <20210115134116.55d196ebbc0051c75e3440f8@gmx.com>
In-Reply-To: <20210113171159.ed46ea46b7af0cc6cf2a85d8@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pLdAuRxp1O99yNakdPVj/HmP8w5h8shkgcyb1rCmvdfwbf0RjGD
 LJxhUuJSjdM7C6QHmIexI95rcJ1eehSCo2R/n91a+YSgxpWuVs2fnQyjVqONUGV7tV0k80p
 p3YJGsRHBlUICLsWKu1OG4o4OP9dpza0eQ2KGFo6IypnMH5NWFzTWT+ky6eKmzb0RJfkYII
 dVl411QMrcobVG6maTBIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m793sJLV040=:K2j6OnqPF7B56Tnvuu7ThP
 eH991diRk17SMnbEXsT+ma3j//BrEUjVNSxY6M5/1jIG3ovWLwvUbhjaIqu9IJw/75l5xsQmD
 TACg+UQh9Nj195ECki+8fiYHGzjT4spQ2AvUFXAJDTFKWTYOKPwUFIyJslhpUJNoekJi8kOdy
 +Dvm8qrn1j0Iv43mb3T1PDuiAmtz4iW8twI7F0IvHnv5lGSUBBtk5ta01SrmwWU9VG5H7VY2z
 gR42Q8YyEj9rn6whVF+dIvq++aTubbq77b2RVX2zmn7JT3NfAwUq+uae2e9NnsqTBGkA+qHWI
 1qQ2kcZ/WGdGyRkZ2wCJErX+zDPAMzMR6aPDTzLo1WTOsteMUxaBb8yH9n4HyTNInM8/1rIYE
 3xnFTfj2eyuJXzuJUd5ZUkSxm6jLqU/0Mycy7BwmwRE9/ebPGyOLPgj6cEowKKmQNbT4wsnZ6
 I0r2CyIpIztLlxezxqfBU2WZFXWrBbaDqOMqFWVRCVnGIWH/gr9G3sYehcJt2hFIdmNayRLQg
 lYuXZhxplSG6urwXAH5fgeWWzZbVtH4l2BV7RrrAKdKEi1Wzz7qN10BE4/syEf3qlbESj4YCt
 W3xOCRgU0sBxORpUbQ8VBcH37rmrPhb7g5qvde5IHQnxu+jaoplsnQ10G5htdOXrNPguMOK70
 yFtvr/nYjPtf2AOCa0KqWGLVwigdeScUAhRBMRBVYBMnGYGn/gmsncq5B61B4wd9zGiVE3sBJ
 OHV8zuH97UMEsHQUeaHG1v3YiFtwIDiUNUpOlLxBGUS+T5h3TXx2deSkWwwj1xpeKlRTEUDGL
 /waXgnUPSnYd9yKlfCA4Thm67DsQluMg6VSYvfN8P6yHhHw6RslayyY6Hs6+3e6Vy3bdEZwEy
 jlz3jgOoijRJVCsOxblA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Hans,

This patch hasn't received any comment since Jan 4 (unchanged since
the first sending). Is it ok?

- Lauri
